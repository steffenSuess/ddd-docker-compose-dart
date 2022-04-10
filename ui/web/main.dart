import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

void main() {
  var now = querySelector('#now');
  Timer.periodic(Duration(milliseconds: 1000), ((timer) async {
    const path = 'http://localhost:3000';
    final url = Uri.parse(path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse['now']);
      now?.innerText = jsonResponse['now'];
    }
  }));
}
