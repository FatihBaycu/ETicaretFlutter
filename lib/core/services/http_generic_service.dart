import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpGenericService{

  String getToken="Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoic3RyaW5nIiwibmJmIjoxNjcwNjg5ODE4LCJleHAiOjE2NzE5ODU4MTgsImlzcyI6Ind3dy5teWFwaS5jb20iLCJhdWQiOiJ3d3cuYmlsbWVtbmUuY29tIn0.4UawFruHWhTGdVov_u9Y2TvOCsgNuRsJwHKa0mlmyWg";

  genericHttGet(String path) async {
    var response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': getToken
      },
    );
    if(response.statusCode!=200)
      return print("title message");

    return response;
  }

  generateHttpPost<T>(T entity, String url) async {
    var response = await http.post(
      Uri.parse(url),
      body: (jsonEncode(entity)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': getToken
      },
    );
    return response;
  }

  generateHttpPut<T>(T entity, String url) async {
    var response = await http.post(
      Uri.parse(url),
      body: (jsonEncode(entity)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': getToken
      },
    );
    return response;
  }

  
  generateHttpDeleteWithQuery(String id, String url) async {
    var response = await http.delete(
      Uri.parse(url+id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': getToken
      },
    );
    return response;
  }
}