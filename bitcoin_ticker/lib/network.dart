import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  Uri url;
  NetworkHelper({required this.url});
  Future<dynamic> getData() async {
    var response = await http.get(url);
    print(response.body);
    return jsonDecode(response.body);
  }
}
