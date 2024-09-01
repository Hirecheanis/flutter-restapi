import 'package:appi/models/User.dart';
import 'package:appi/models/User_name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class UserApi {

  static Future<List<User>> fetchData() async {
    
    const url = 'https://randomuser.me/api/?results=15';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return User(name,
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat']);
    }).toList();
return users;
    
   
    
  }

}