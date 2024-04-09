import 'package:flutter/material.dart';
import '../../nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nallagram/widgets/image_banner.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Register extends StatefulWidget {
  static const String id = 'register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  User user; //never gonna change  
  String email;
  String password;
  String name;
  List<String> profiles = [
    'https://cdn.dribbble.com/users/86682/screenshots/10441196/penguin.png',
    'https://cdn.dribbble.com/users/1162077/screenshots/7475318/media/8837a0ae1265548e27a2b2bb3ab1f366.png',
    'https://cdn.dribbble.com/users/1162077/screenshots/7495197/media/92507bdcf4b5edfa12d5e9cc4f01b301.png',
    'https://cdn.dribbble.com/users/1162077/screenshots/7542499/media/d6f3265e5017257e5900b762754f2655.png',
    'https://cdn.dribbble.com/users/1162077/screenshots/5940704/media/6a37a16dc390eed6c93f6f5020af211a.png'
  ];
  String photoUrl(List<String> pfls) {
    return pfls.elementAt(Random().nextInt(pfls.length));
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // SizedBox(height: 100.0),
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 170.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageBanner('images/Logo.png'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Create your account",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "We are so excited to have you on board!"
                        ),
                      ]
                    ),
                  ),
                  TextField(
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      //Do something with the user input.
                      name = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 20.0, 10.0, 20.0),
                        child: FaIcon(FontAwesomeIcons.user, color: Colors.black)
                      ),
                      hintText: 'Enter your name',
                      contentPadding:
                          EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 20.0, 10.0, 20.0),
                        child: FaIcon(FontAwesomeIcons.envelope, color: Colors.black)
                      ),
                      hintText: 'Enter your email',
                      contentPadding:
                        EdgeInsets.fromLTRB(30.0, 20.0, 5.0, 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      password = value;

                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 20.0, 10.0, 20.0),
                        child: FaIcon(FontAwesomeIcons.key, color: Colors.black)
                      ),
                      hintText: 'Enter a 6 digit password',
                      contentPadding:
                          EdgeInsets.fromLTRB(30.0, 20.0, 5.0, 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      // color: Colors.blueAccent,
                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      // elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            // showSpinner = true;
                          });

                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            User user = newUser.user;
                            await user.updateDisplayName(name);
                            debugPrint('movieTitle:::: $user');
                            var pfp = photoUrl(profiles);
                            await user.updatePhotoURL(pfp);
                            await _store
                              .collection('users')
                              .doc("test")
                              .set({
                                'name': name,
                                'profile': pfp,
                                'followerlist': [""],
                                'followinglist': [""],
                                'descr':
                                    'Tap edit profile to update profile photo and description',
                                'followers': 0,
                                'userid': user.uid,
                                'following': 0,
                                'posts': 0
                              });
                            // print("New User!!!!");
                            // print(newUser.toString());
                            // User user = newUser.user;
                            // user.updateDisplayName(name);
                            // var pfp = photoUrl(profiles);
                            // user.updatePhotoURL(pfp);
                            // _store.collection('users').add({
                            //   'name': name,
                            //   'profile': pfp,
                            //   'followerlist': [""],
                            //   'followinglist': [""],
                            //   'descr':
                            //       'Tap edit profile to update profile photo and description',
                            //   'followers': 0,
                            //   'userid': user.uid,
                            //   'following': 0,
                            //   'posts': 0
                            // });
                            // _store.collection('users').doc(user.uid).set({
                            //   'name': name,
                            //   'profile': pfp,
                            //   'followerlist': [""],
                            //   'followinglist': [""],
                            //   'descr':
                            //       'Tap edit profile to update profile photo and description',
                            //   'followers': 0,
                            //   'userid': user.uid,
                            //   'following': 0,
                            //   'posts': 0
                            // });

                            // if (newUser != null) {
                            //   showSpinner = false;
                            //   Navigator.pushNamed(context, Nav.id);
                            // }
                          }
                          //Implement registration functionality.
                          //as it is returning a future we assign a final variable to it
                          catch (e) {
                            print(e);
                          } finally {
                            showSpinner = false;
                          }
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.deepPurple,
                            Colors.blueAccent,
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
