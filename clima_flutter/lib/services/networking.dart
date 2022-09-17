import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.uri);
  final Uri uri;
  Future getData() async {
    var response = await http.get(uri);
    if(response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else{
      print(response.statusCode);
    }
  }
}
