import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_sqflite/src/db/profile_database.dart';
import 'package:flutter_sqflite/src/models/user.dart';
import 'package:flutter_sqflite/src/utils/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  final int userId;

  static Route<dynamic> route(int userId) => MaterialPageRoute(
        builder: (context) => ProfileScreen(
          userId: userId,
        ),
      );

  const ProfileScreen({Key key, this.userId}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User currentUser;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewPortConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewPortConstraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        _userProfilePicture(),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentUser != null ?
                              currentUser.username : "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              currentUser != null ?
                              currentUser.email : "",
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  _userPhoneNumber(),

                  SizedBox(height: 20,),

                  Divider(
                    indent: 16.0,
                    endIndent: 16.0,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 20,),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(AppLocalizations.of(context).balance,
                        style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold, color: Colors.grey[400]),),
                    ),
                  ),

                  SizedBox(height: 30,),

                  _userBalance(),

                  SizedBox(height: 30,),

                  Divider(
                    indent: 16.0,
                    endIndent: 16.0,
                    color: Colors.grey,
                  ),

                  Expanded(child: Align(alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0,
                        horizontal: 30),
                        child: _logout(),
                      ))),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _userProfilePicture() {
    String assetName = 'assets/images/profile_avatar.svg';
    return GestureDetector(
        onTap: () {
          //_showChoiceDialog(context).then((value) {});
        },
        child: Center(
          child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
              alignment: Alignment.center,
              height: 100,
              width: 100,
              child: SvgPicture.asset(
                assetName,
                semanticsLabel: AppLocalizations.of(context).profilePicture,
              )),
        ));
  }

  Widget _userPhoneNumber(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        width: 25,
        height: 25,
        child: SvgPicture.asset(
          'assets/images/telephone.svg',
          semanticsLabel: AppLocalizations.of(context).phoneNumber,
        ),
      ),
      SizedBox(width: 10,),
      Text(
        currentUser != null ?
        currentUser.phoneNumber : "",
        style: TextStyle(color: Colors.grey[600]),
      ),
    ],);
  }

  Widget _userBalance() {
    String assetName = 'assets/images/balance.svg';
    return GestureDetector(
        onTap: () {
          //_showChoiceDialog(context).then((value) {});
        },
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                alignment: Alignment.center,
                height: 150,
                width: 150,
                child: SvgPicture.asset(
                  assetName,
                  semanticsLabel: AppLocalizations.of(context).profilePicture,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context).balance),
                Text(" : "),
                Text("0"),
              ],
            )
          ],
        ));
  }

  Widget _logout(){
    return Text("Log Out", style: TextStyle(fontSize: 16,
    fontWeight: FontWeight.bold, color: AppTheme.primaryColor),);
  }

  Future fetchUser() async {
    ProfileDatabase.instance.fetchUser(widget.userId).then((user) {
      setState(() {
        currentUser = user;
      });
    });
  }
}
