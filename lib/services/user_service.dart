import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_v2/models/user_model.dart';

class UserService extends ChangeNotifier{
  static Future<List<UserModel>> getUsers() async {
    var res = await Dio().get('https://nct-api.vercel.app/user');
    try {
      if(res.statusCode == 200){
        final listUser = ListUserModel.fromJson(res.data);
        print(listUser);
        return listUser.users ?? [];
      } else {
        print('Error: ${res.statusCode}, ${res.data}');
        throw Exception('Failed to get user');
      }
    } catch (e) {
      print('error exception: $e');
      throw Exception('Failed to get user');
    }
  }
}