import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/models/user_model.dart';


getuser()async{
  var uri =Uri.parse("https://maaz-api.tga-edu.com/api/users");
  var response = await http.get(uri);
  // var response = await http.get(Uri.https("maaz-api.tga-edu.com", "/api/users"));
  var jsonData = jsonDecode(response.body);
  return UserModel.fromJson(jsonData);
}

postData(Data model)async{
  var uri =Uri.parse("https://maaz-api.tga-edu.com/api/users");
  await http.post(uri,
  headers: {"Content-Type": "aplication/json"},
  body: jsonEncode(model.toJson())  
  );

}

updateData({required Data model ,required id})async{
  var uri =Uri.parse("https://maaz-api.tga-edu.com/api/users/${id}");
  await http.put(uri,
  headers: {"Content-Type" : "aplication/json"},
  body: jsonEncode(model.toJson())
  );

}

deletData({required id})async{
  var uri =Uri.parse("https://maaz-api.tga-edu.com/api/users/${id}");
  await http.delete(uri,
  headers: {"Content-Type" : "application/json"}
  );

}