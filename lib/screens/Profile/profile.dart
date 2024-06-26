import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nallagram/screens/Profile/edit_profile.dart';
import 'package:nallagram/screens/Posts/postView_model.dart';
import 'package:nallagram/screens/Story/storyview.dart';
import 'package:nallagram/screens/settings/settings.dart';


import 'profile_upload.dart';
final _auth = FirebaseAuth.instance;
final _store = FirebaseFirestore.instance;
bool _persposts = true;

void getProfileData() async {
  final info = await _store.collection('users').doc(loggedInUser.uid).get();
  Map data = info.data();
  followers = data['followers'];
  following = data['following'];
  descr = data['descr'];
  posts = data['posts'];
}

void getCurrentUser() {
  try {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  } catch (e) {
    print(e);
  }
}

int posts;
var descr;
int followers;
int following;

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: Container(
                    width: 80,
                    height: 80,
                    decoration: rimage != null
                        ? BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(25),
                          )
                        : BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  loggedInUser.photoURL),
                              fit: BoxFit.cover,
                            )),
                    child: rimage != null
                        ? Image.file(
                            rimage,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        : Container()),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      '$posts',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Metropolis'),
                    ),
                  ),
                  Text(
                    'Posts',
                    style: TextStyle(fontFamily: 'Metropolis', fontSize: 12),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      '$followers',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Metropolis'),
                    ),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(fontFamily: 'Metropolis', fontSize: 12),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '$following',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Metropolis'),
                    ),
                  ),
                  Text(
                    'Following',
                    style: TextStyle(fontFamily: 'Metropolis', fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              loggedInUser.displayName.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
              overflow: TextOverflow.clip,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'Metropolis'),
                  text: descr),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EditPage()));
                    },
                    child: Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.black),
                    )),
              )),
              SizedBox(width: 10),
              Expanded(
                  child: Container(
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  AppSettings(),) );
                    },
                    child: Text(
                      'Settings',
                      style: TextStyle(color: Colors.black),
                    )),
              )),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Highlight(
                    name: 'Entrepreneur',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxAdXZPbrMNnDXc6K80XJMllpgn1JXSzfHwo3Q19P1CJFK8X6upvvSr4HcVq5bDyyevec&usqp=CAU'),
                Highlight(
                    name: 'Dancer',
                    url:
                        'https://as2.ftcdn.net/v2/jpg/04/48/03/51/1000_F_448035101_32M9iutC4cATVpFMumWgXp086q70VT8M.jpg'),
                Highlight(
                    name: 'DJ',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyLYyv6YASAmQZspd6o0mF93PHWG9l8FGSVSr24KqzpOUuTMbNr_9sUSSPU80zlPqguQw&usqp=CAU'),
                Highlight(
                    name: 'Artist',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQecvx6qEO96CTZj3rZnLA4t9g5JnWlZJAZHvqH4JO5RQ&s'),
                Highlight(
                    name: 'Studio',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_mdlJUVk5IJ5gEZHoTCz3Lf7BJ113tiXGO_axg6QdgQ&s'),
              ],
            ),
          ),
          ProfilePosts(),
        ],
      ),
    );
  }
}

class Highlights extends StatefulWidget {
  final String name;
  final String url;

  Highlights({@required this.name, @required this.url});

  @override
  _HighlightsState createState() => _HighlightsState();
}

class _HighlightsState extends State<Highlights> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Column(children: <Widget>[]),
    );
  }
}

class ProfilePosts extends StatefulWidget {
  @override
  _ProfilePostsState createState() => _ProfilePostsState();
}

class _ProfilePostsState extends State<ProfilePosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Material(
                    type: MaterialType
                        .transparency, //Makes it usable on any background color, thanks @IanSmith
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: _persposts ? Colors.black : Colors.grey,
                                width: 0.5)),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: InkWell(
                        //This keeps the splash effect within the circle
                        borderRadius: BorderRadius.circular(
                            1000), //Something large to ensure a circle
                        onTap: () {
                          setState(() {
                            _persposts = true;
                          });
                        },
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: FaIcon(
                              FontAwesomeIcons.thLarge,
                              color: _persposts ? Colors.black : Colors.grey,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Material(
                  type: MaterialType
                      .transparency, //Makes it usable on any background color, thanks @IanSmith
                  child: Ink(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: _persposts ? Colors.grey : Colors.black,
                                width: 0.5)),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: InkWell(
                        //This keeps the splash effect within the circle
                        borderRadius: BorderRadius.circular(
                            1000.0), //Something large to ensure a circle
                        onTap: () {
                          setState(() {
                            _persposts = false;
                          });
                        },
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: FaIcon(
                              FontAwesomeIcons.userTag,
                              size: 15,
                              color: _persposts ? Colors.grey : Colors.black,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
          _persposts ? ProfilePostsStream() : Expanded(child: Tagged()),
        ],
      ),
    );
  }
}

class ImagePost extends StatelessWidget {
  final String url;
  final bool isMe = true;
  ImagePost({@required this.url});
  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => POstView(url)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.red.shade100,
            image: DecorationImage(
                image: CachedNetworkImageProvider(url), fit: BoxFit.cover),
          ),
        ),
      );
    }
  
  }
}

class ProfilePostsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store
          .collection('users')
          .doc(loggedInUser.uid)
          .collection('posts')
          .snapshots(),
      builder: (context, snapshot) {
        List<ImagePost> ImagePosts = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }
        final posts = snapshot.data.docs.reversed;

        for (var post in posts) {
          if (post['userid'] == loggedInUser.uid) {
            final image = post['url'];
            final imagePost = ImagePost(
              url: image,
            );
            ImagePosts.add(imagePost);
          }
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: ImagePosts,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          ),
        );
      },
    );
  }
}

class Tagged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[Text('No photos yet')],
      ),
    );
  }
}

class Highlight extends StatefulWidget {
  final String name;
  final String url;

  Highlight({this.name, this.url});

  @override
  _HighlightState createState() => _HighlightState();
}

class _HighlightState extends State<Highlight> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StoryPageView()));
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(widget.url), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.fromLTRB(10.0, 5.0, 8.0, 5.0),
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.name,
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 11.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
