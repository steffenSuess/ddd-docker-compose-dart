import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main(List<String> arguments) async {
  final app = Router();
  const port = 3000;

  // CORS Settings
  const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Origin, Content-Type',
  };

  app.get('/', (Request request) {
    var data = {'now': DateTime.now().toIso8601String()};
    return Response.ok(json.encode(data), headers: {
      'Content-Type': 'application/json',
      ...corsHeaders,
    });
  });

  // Set CORS headers with every request
  final handler = Pipeline().addMiddleware((innerHandler) {
    return (request) async {
      final response = await innerHandler(request);
      print(request.headers);

      // Set CORS when responding to OPTIONS request
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: corsHeaders);
      }

      // Move onto handler
      return response;
    };
  }).addHandler(app);

  await io.serve(handler, InternetAddress.anyIPv4, port);

  print('Server listening on port $port');
}
