import 'dart:convert';
import 'package:http/http.dart';
class HttpService {

  static postTest(uri,requestBody) async {
    // final uri = 'https://na57.salesforce.com/services/oauth2/token';
    print("start");
    Response  response = await post(
        uri,
        body: json.encode(requestBody),
        headers: {
        "Accept": "application/json",
        "content-type":"application/json",
        },
    );
    // print(response.body);
    return response.body;
  }

}




 