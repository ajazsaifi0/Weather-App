import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String link;
  NetworkHelper(this.link);
  Future getData() async {
    Uri url = Uri.parse(link);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var backdata = jsonDecode(data);
      return backdata;
    } else {
      print(response.statusCode);
    }
  }
}
