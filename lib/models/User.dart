import 'package:appi/models/User_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;

  User(this.name,
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat});

  String fullName() {
    return '${name.title}. ${name.first} ${name.last}';
  }
}
