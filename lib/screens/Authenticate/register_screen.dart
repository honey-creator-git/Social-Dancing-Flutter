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

  @override
  void initState() {
    super.initState();
    _auth.useAuthEmulator('localhost', 9099);
  }

  User user; //never gonna change  
  String email;
  String password;
  String name;
  List<String> profiles = [
    'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXUdZHEIh62u6gLJUM4dybb83j4DzSD4zcKKfvmQkttAKaRY8qJskarlA7SWzaEE78KSg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-ngJBzgC87qJ4Bfp7kqULVMRhsxsALwaqjdIOzkoBxgBiDv7-8KwiupW3-D1lAtbbrw8&usqp=CAU',
    'https://thumbs.dreamstime.com/b/woman-laying-grass-5455137.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRM-s5JJFWxcD9623Xk8besdStfRp4YasZQy54dbeuyFEGGkTpTyIm1L_dyOxvxpuC03w&usqp=CAU',
    'https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg',
    'https://blog.photofeeler.com/wp-content/uploads/2017/09/instagram-profile-picture-maker.jpg',
    'https://i.pinimg.com/736x/5d/e1/84/5de184caac6ed1ed08c1dcecabcd1fc8.jpg',
    'https://i.pinimg.com/originals/63/f9/d5/63f9d5fd5f34c8544a31c22c3e909cec.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_oCSpNyceseWF8FaomiEv5k6QEfZq1Ck0HAFzFqFer7dIDYnU2l1IbDFbM8WmQLiL8Z4&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Lf7wdlXTOR9yqBpWtuo2pid1EilQ0bxnRTSBZvPPkhlDBGlBQee7QraOponv6JSgf4c&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCwHF4W1YpjtRVl3u_2lRnzrbqPwYSltyRzkGthXRmgQ&s',

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
                            showSpinner = true;
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
                              .doc(user.uid)
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
                            if (newUser != null) {
                              showSpinner = false;
                              Navigator.pushNamed(context, Nav.id);
                            }
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
