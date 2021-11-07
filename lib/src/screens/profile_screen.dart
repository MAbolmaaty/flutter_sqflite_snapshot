import 'package:flutter/material.dart';
import 'package:flutter_sqflite/src/db/profile_database.dart';
import 'package:flutter_sqflite/src/models/user.dart';

class ProfileScreen extends StatefulWidget {

  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => ProfileScreen(),
  );

  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user;

  @override
  void initState(){
    super.initState();

    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('Profile Screen'),),
      ),
    );
  }

  Future fetchUser() async {
    user = await ProfileDatabase.instance.fetchUser(3);
    print ("username : " + user.username);
  }
}
