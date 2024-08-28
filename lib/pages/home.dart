import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<dynamic> data = [];

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
          itemCount: data.length,
          itemBuilder: (context, index) {
            final user = data[index];
            final email = user['email'];
            final name = user['name']['first'];
            final image = user['picture']['thumbnail'];
            return ListTile(
                leading:  ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(image)),
                title: Text(name),
                subtitle: Text(email));
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

    setState(() {
      data = json['results'];
    });
    print('fetchData completed');
  }
}
