import 'package:flutter/material.dart';
import 'package:flutter_json_parsing/users.dart';
import 'services.dart';

class MyContactsScreen extends StatefulWidget {
  MyContactsScreen({Key key}) : super(key: key);

  @override
  _MyContactsScreenState createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen> {
  List<Users> _users;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getUsers().then((user) {
      setState(() {
        _users = user;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Contact List'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: _users == null ? 0 : _users.length,
            itemBuilder: (context, index) {
              Users users = _users[index];
              return ListTile(
                title: Text(users.name),
                subtitle: Text(users.username),
              );
            }),
      ),
    );
  }
}
