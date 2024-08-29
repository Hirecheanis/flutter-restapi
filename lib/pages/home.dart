import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/User.dart';

List<User> users = [];

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            final gender = user.gender;
            final phone = user.phone;
            //final image = user['picture']['thumbnail'];
            return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: /*Image.network(image))*/ Text('${index + 1}')),
                title: Text(email),
                subtitle: Text(phone));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
      ),
    );
  }

  void fetchData() async {
    print("fetch Data called");
    final url = 'https://randomuser.me/api/?results=13';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
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

    setState(() {

users = transformed;

    });
    print('fetchData completed');
  }
}
