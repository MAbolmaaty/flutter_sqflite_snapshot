import 'dart:io';

import 'package:flutter/material.dart';
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

  File imageFile;
  bool passwordVisible = false, passwordConfirmationVisible = false;

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
                _userProfilePicture(context),

                ///
                /// Username
                //_usernameField(context),

                ///
                /// User email address
                //_emailAddressField(context),

                ///
                /// User password
                // AppWidgets.passwordField(
                //     context,
                //     AppLocalizations.of(context).password,
                //     AppLocalizations.of(context).enterPassword,
                //     (value) => _password = value,
                //     !passwordVisible,
                //     () => setState(() {
                //           passwordVisible = !passwordVisible;
                //         })),

                ///
                /// User password confirmation
                // AppWidgets.passwordField(
                //     context,
                //     AppLocalizations.of(context).confirmPassword,
                //     AppLocalizations.of(context).pleaseConfirmPassword,
                //     (value) => _passwordConfirmation = value,
                //     !passwordConfirmationVisible,
                //     () => setState(() {
                //           passwordConfirmationVisible =
                //               !passwordConfirmationVisible;
                //         })),

                ///
                /// User phone number
                //_userPhoneNumber(context),

                ///
                /// Register
                //_registerButton(context),

                ///
                /// Or Divider
                //AppWidgets.orDivider(context),

                //////////////////////////////// Login
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       AppLocalizations.of(context).alreadyHaveAccount,
                //       style: TextStyle(
                //           color: Colors.grey,
                //           fontSize: 12,
                //           fontWeight: FontWeight.normal),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.of(context).pop();
                //       },
                //       child: Text(
                //         AppLocalizations.of(context).login,
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 14,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),
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

  Widget _userProfilePicture(BuildContext context) {
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
              semanticsLabel: AppLocalizations.of(context).loginTitle,)),
        ));
  }

  // Widget _usernameField(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
  //     child: TextFormField(
  //       maxLines: 1,
  //       validator: (value) =>
  //           value.isEmpty ? AppLocalizations.of(context).enterUsername : null,
  //       onSaved: (value) => _username = value,
  //       decoration: InputDecoration(
  //           contentPadding:
  //               EdgeInsets.only(top: 11, bottom: 11, left: 16, right: 16),
  //           labelText: AppLocalizations.of(context).username,
  //           labelStyle: TextStyle(
  //             color: const Color(0xFF9e9e9e),
  //             fontSize: 13,
  //           ),
  //           alignLabelWithHint: true,
  //           border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           isDense: true),
  //     ),
  //   );
  // }
  //
  // Widget _emailAddressField(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
  //     child: TextFormField(
  //       maxLines: 1,
  //       validator: (value) =>
  //           value.isEmpty ? AppLocalizations.of(context).enterEmail : null,
  //       onSaved: (value) => _email = value,
  //       decoration: InputDecoration(
  //           contentPadding:
  //               EdgeInsets.only(top: 11, bottom: 11, left: 16, right: 16),
  //           labelText: AppLocalizations.of(context).email,
  //           labelStyle: TextStyle(
  //             color: const Color(0xFF9e9e9e),
  //             fontSize: 13,
  //           ),
  //           alignLabelWithHint: true,
  //           border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           isDense: true),
  //       keyboardType: TextInputType.emailAddress,
  //     ),
  //   );
  // }
  //
  // Widget _userPhoneNumber(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
  //     child: TextFormField(
  //       maxLines: 1,
  //       validator: (value) => value.isEmpty
  //           ? AppLocalizations.of(context).enterPhoneNumber
  //           : null,
  //       onSaved: (value) => _phoneNumber = value,
  //       decoration: InputDecoration(
  //           contentPadding:
  //               EdgeInsets.only(top: 11, bottom: 11, left: 16, right: 16),
  //           labelText: AppLocalizations.of(context).phoneNumber,
  //           labelStyle: TextStyle(
  //             color: const Color(0xFF9e9e9e),
  //             fontSize: 13,
  //           ),
  //           prefixIcon: CountryCodePicker(
  //             onChanged: (code) {},
  //             initialSelection: 'SA',
  //             showCountryOnly: false,
  //             showOnlyCountryWhenClosed: false,
  //             showFlag: false,
  //             showFlagDialog: true,
  //           ),
  //           border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(25.0),
  //               borderSide: BorderSide(color: const Color(0xffE3E3E6))),
  //           isDense: true),
  //       keyboardType: TextInputType.phone,
  //     ),
  //   );
  // }
  //
  // Widget _registerButton(BuildContext context) {
  //   var authenticationApi = Provider.of<AuthenticationApi>(context);
  //   return GestureDetector(
  //       onTap: () {
  //         //// Hide keyboard
  //         FocusScope.of(context).unfocus();
  //         final form = formKey.currentState;
  //         if (form.validate()) {
  //           form.save();
  //           if (_password == _passwordConfirmation) {
  //             authenticationApi
  //                 .register(_username, _email, _password, _passwordConfirmation,
  //                     _phoneNumber, imageFile)
  //                 .then((result) {
  //               if (result['status']) {
  //                 UserPreferences.saveApiToken(
  //                     authenticationApi.authenticationResponseModel.jwt);
  //                 Navigator.of(context).pushAndRemoveUntil(
  //                     BottomNavScreen.route(
  //                         currentIndex: 2, realEstateId: widget.realEstateId),
  //                     (route) => false);
  //               }
  //             });
  //           } else {
  //             sKey.currentState.showSnackBar(SnackBar(
  //               content: Text(
  //                 AppLocalizations.of(context).passwordsDoNotMatch,
  //               ),
  //             ));
  //           }
  //         }
  //       },
  //       child: Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: 55,
  //         margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
  //         alignment: Alignment.center,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //             color: const Color(0xffFFDB27)),
  //         child: authenticationApi.authenticationStatus ==
  //                 AuthenticationStatus.Authenticating
  //             ? _loading()
  //             : Text(
  //                 AppLocalizations.of(context).register,
  //                 style: TextStyle(
  //                   fontSize: 15,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //       ));
  // }
  //
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
}
