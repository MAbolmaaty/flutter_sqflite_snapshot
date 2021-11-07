import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite/src/db/profile_database.dart';
import 'package:flutter_sqflite/src/models/user.dart';
import 'package:flutter_sqflite/src/screens/profile_screen.dart';
import 'package:flutter_sqflite/src/utils/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      );

  RegisterScreen();

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final sKey = GlobalKey<ScaffoldState>();

  String _username, _email, _password, _passwordConfirmation, _phoneNumber;

  // File imageFile;
  // bool passwordVisible = false, passwordConfirmationVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: sKey,
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///
                /// User profile picture
                _userProfilePicture(),

                SizedBox(height: 10,),

                ///
                /// Change Profile Picture
                _changeProfilePicture(),

                SizedBox(height: 40,),

                ///
                /// Username
                _usernameField(),

                ///
                /// User email address
                _emailAddressField(),

                ///
                /// User password
                _passwordField(
                    AppLocalizations.of(context).password,
                    "",
                        (value){_password = value;},
                    false,
                    (){}),

                ///
                /// User password confirmation
                _passwordField(
                    AppLocalizations.of(context).confirmPassword,
                    "",
                        (value){_passwordConfirmation = value;},
                    false,
                        (){}),

                ///
                /// User phone number
                _userPhoneNumber(),

                ///
                /// Register
                _registerButton(),
              ],
            ),
          ),
        ));
  }

  // _openGallery(BuildContext context) async {
  //   var picture = await ImagePicker().getImage(source: ImageSource.gallery);
  //   setState(() {
  //     imageFile = File(picture.path);
  //   });
  //   Navigator.of(context).pop();
  // }
  //
  // _openCamera(BuildContext context) async {
  //   var camera = await ImagePicker().getImage(source: ImageSource.camera);
  //   setState(() {
  //     imageFile = File(camera.path);
  //   });
  //   Navigator.of(context).pop();
  // }

  // Future<void> _showChoiceDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Make a Choice"),
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: [
  //                 GestureDetector(
  //                   child: Text("Gallary"),
  //                   onTap: () {
  //                     _openGallery(context);
  //                   },
  //                 ),
  //                 Padding(padding: EdgeInsets.all(8.0)),
  //                 GestureDetector(
  //                   child: Text("Camera"),
  //                   onTap: () {
  //                     _openCamera(context);
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  Widget _userProfilePicture() {
    String assetName = 'assets/images/profile_avatar.svg';
    return GestureDetector(
        onTap: () {
          //_showChoiceDialog(context).then((value) {});
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(color: Colors.grey[400],
            shape: BoxShape.circle),
              alignment: Alignment.center,
              height: 100,
              width: 100,
              child: SvgPicture.asset(assetName,
              semanticsLabel: AppLocalizations.of(context).profilePicture,)),
        ));
  }

  Widget _changeProfilePicture(){
    return Text(
      AppLocalizations.of(context).changePicture,
      style: TextStyle(
        color: AppTheme.primaryColor,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
      child: TextFormField(
        maxLines: 1,
        // validator: (value) =>
        //     value.isEmpty ? AppLocalizations.of(context).enterUsername : null,
        onSaved: (value) => _username = value,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
            labelText: AppLocalizations.of(context).username,
            labelStyle: TextStyle(
              color: const Color(0xFF9e9e9e),
              fontSize: 12,
            ),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            isDense: true),
      ),
    );
  }

  Widget _emailAddressField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
      child: TextFormField(
        maxLines: 1,
        // validator: (value) =>
        //     value.isEmpty ? AppLocalizations.of(context).enterEmail : null,
        onSaved: (value) => _email = value,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
            labelText: AppLocalizations.of(context).email,
            labelStyle: TextStyle(
              color: const Color(0xFF9e9e9e),
              fontSize: 12,
            ),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            isDense: true),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _passwordField(
      String hintText,
      String validationMessage,
      Function onSaved,
      bool obscureText,
      Function suffixIconOnTap) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
      child: TextFormField(
        maxLines: 1,
        validator: (value) => value.isEmpty ? validationMessage : null,
        onSaved: onSaved,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
            labelText: hintText,
            labelStyle: TextStyle(
              color: const Color(0xFF9e9e9e),
              fontSize: 12,
            ),
            suffixIcon: GestureDetector(
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xffE3E3E6),
                size: 25,
              ),
              onTap: suffixIconOnTap,
            ),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            isDense: true),
      ),
    );
  }

  Widget _userPhoneNumber() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
      child: TextFormField(
        maxLines: 1,
        // validator: (value) => value.isEmpty
        //     ? AppLocalizations.of(context).enterPhoneNumber
        //     : null,
        onSaved: (value) => _phoneNumber = value,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
            labelText: AppLocalizations.of(context).phoneNumber,
            labelStyle: TextStyle(
              color: const Color(0xFF9e9e9e),
              fontSize: 12,
            ),
            // prefixIcon: CountryCodePicker(
            //   onChanged: (code) {},
            //   initialSelection: 'SA',
            //   showCountryOnly: false,
            //   showOnlyCountryWhenClosed: false,
            //   showFlag: false,
            //   showFlagDialog: true,
            // ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: const Color(0xffE3E3E6))),
            isDense: true),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
        onTap: () {
          //// Hide keyboard
          FocusScope.of(context).unfocus();
          final form = formKey.currentState;
          if (form.validate()) {
            form.save();
            if (_password == _passwordConfirmation) {
                signup(_username, _email, _password, _phoneNumber).
                then((user) =>
                    Navigator.of(context).push(ProfileScreen.route(user.id)));
            } else {
              sKey.currentState.showSnackBar(SnackBar(
                content: Text(
                  AppLocalizations.of(context).passwordsDoNotMatch,
                ),
              ));
            }
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: AppTheme.primaryColor),
          child: Text(
            AppLocalizations.of(context).register.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
            ),
          ),
        ));
  }

  // Widget _loading() {
  //   return Center(
  //     child: SizedBox(
  //       child: CircularProgressIndicator(
  //           backgroundColor: const Color(0xffFFDB27),
  //           strokeWidth: 2,
  //           valueColor: new AlwaysStoppedAnimation<Color>(Colors.black)),
  //       height: 20,
  //       width: 20,
  //     ),
  //   );
  // }

  Future<User> signup(String username, String email, String password,
      String phoneNumber) async {
    final user = User(
        username: username,
        email: email,
        password: password,
        phoneNumber: phoneNumber);

    return await ProfileDatabase.instance.create(user);
  }
}
