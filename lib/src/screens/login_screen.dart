
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_sqflite/src/db/profile_database.dart';
import 'package:flutter_sqflite/src/models/user.dart';
import 'package:flutter_sqflite/src/screens/profile_screen.dart';
import 'package:flutter_sqflite/src/screens/register_screen.dart';
import 'package:flutter_sqflite/src/utils/app_theme.dart';
// import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  // static Route<dynamic> route({bool showBackButton, String realEstateId}) =>
  //     MaterialPageRoute(
  //       builder: (context) => LoginScreen(
  //         showBackButton: showBackButton,
  //         realEstateId: realEstateId,
  //       ),
  //     );

  // final bool showBackButton;
  // final String realEstateId;

  //LoginScreen({this.showBackButton, this.realEstateId});
  LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final formKey = GlobalKey<FormState>();
  // bool rememberMe = true;
  // bool obsecurePassword = true;
  // var _identifier, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewPortConstraints) {
        return SingleChildScrollView(
          child: Form(
            //key: formKey,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewPortConstraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50,),

                    ///
                    /// Screen Title
                    _screenTitle(),

                    SizedBox(height: 40,),

                    ///
                    /// User Email
                    _emailEntryField(),

                    SizedBox(height: 10,),

                    ///
                    /// User password
                    _passwordEntryField(),

                    SizedBox(height: 20,),

                    ///
                    /// Login Button
                    _loginButton(),

                    ///
                    /// Navigate to register screen
                    _doNotHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _screenTitle() {
    return Text(
      AppLocalizations.of(context).loginTitle,
      style: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailEntryField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
      child: TextFormField(
          maxLines: 1,
          // validator: (value) => value.isEmpty
          //     ? AppLocalizations.of(context).enterEmailOrPhoneNumber
          //     : null,
          //onSaved: (value) => _identifier = value,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
              labelText: AppLocalizations.of(context).enterYourEmail,
              labelStyle: TextStyle(
                color: const Color(0xFF9e9e9e),
                fontSize: 12,
              ),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.grey[300])),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.grey[300])),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.grey[300])),
              isDense: true),
          keyboardType: TextInputType.emailAddress),
    );
  }

  Widget _passwordEntryField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
      child: TextFormField(
        maxLines: 1,
        //validator: (value) => value.isEmpty ? validationMessage : null,
        //onSaved: onSaved,
        //obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
            labelText: AppLocalizations.of(context).enterYourPassword,
            labelStyle: TextStyle(
              color: const Color(0xFF9e9e9e),
              fontSize: 12,
            ),
            // suffixIcon: GestureDetector(
            //   child: Icon(
            //     obscureText ? Icons.visibility_off : Icons.visibility,
            //     color: const Color(0xffE3E3E6),
            //     size: 25,
            //   ),
            //   onTap: suffixIconOnTap,
            // ),
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

  Widget _loginButton() {
    return GestureDetector(
        onTap: () async {
          ///
          /// Hide keyboard
          FocusScope.of(context).unfocus();

          //await authenticate();

          Navigator.of(context).push(ProfileScreen.route());

          //final form = formKey.currentState;
          // if (form.validate()) {
          //   form.save();
          // }
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
                  AppLocalizations.of(context).login.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[400],
                  ),
                ),
        ));
  }

  Widget _doNotHaveAccount() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).doNotHaveAccount,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                 Navigator.of(context).push(RegisterScreen.route());
                },
                child: Text(
                  AppLocalizations.of(context).register,
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future authenticate() async {
    final user = User(
      username: 'Em',
      email: 'em@email.com',
      password: '123456',
      phoneNumber: '01001010');

    await ProfileDatabase.instance.create(user);
  }
}
