import 'package:appi/services/user_api.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';

List<User> users = [];

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
            final name = user.name;
            //final image = user['picture']['thumbnail'];
            return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: /*Image.network(image))*/ Text('${index + 1}')),
                title: Text(user.fullName()),
                subtitle: Text(phone));
          }),
    );
  }

  Future<void> fetchData() async {
    final response = await UserApi.fetchData();
    setState(() {
      users = response;
    });
  }
}
