import 'dart:convert';
import 'package:http/http.dart';

import 'BaseConstant.dart';

class HttpService {
  static postTest(uri, requestBody) async {
    print(uri);
    print(requestBody);
    Response response = await post(
      uri,
      body: json.encode(requestBody),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );
    if (response.statusCode == 200){
      print(response.body);
      return response.body;
   }
    else {
      print("post error");
      return null;
    }
  }

  static postTestToken(uri, requestBody) async {
    print(uri);
    print(requestBody);
    print(Cookie.token);
    Response response = await post(
      uri,
      body: json.encode(requestBody),
      headers: {
        "Authorization": Cookie.token,
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );
   
   if (response.statusCode == 200){
      print(response.body);
      return response.body;
   }
    else {
      print("post error");
      return null;
    }
  }
}
