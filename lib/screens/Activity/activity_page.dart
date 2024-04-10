import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListTile _followList(String url, String name, String place) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(url),
          radius: 28.0,
        ),
        title: Text(
          name,
          style: TextStyle(
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        subtitle: Text(
          place,
          style: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 12.0,
          ),
        ),
        trailing: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.userPlus,
            color: Colors.blueAccent,
            size: 19.0,
          ),
        ),
        onTap: () {
          Toast.show("Following list updated!", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        },
      );
    }

    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Card(
                margin: EdgeInsets.fromLTRB(10.0, 20.0, 3.0, 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 30.0,
                shadowColor: Colors.pink,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 50.0, 15.0),
                  height: 101.0,
                  width: 169.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'New Followers',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Last 7 days',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Metropolis',
                            fontSize: 10.0),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '265',
                        style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.redAccent, Colors.orange],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
            //Todo: Randomise Profile pics
            //Todo: Randomise Network images
            Expanded(
              child: Card(
                margin: EdgeInsets.fromLTRB(8.0, 20.0, 10.0, 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 30.0,
                shadowColor: Colors.blue,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 50.0, 10.0),
                  height: 101.0,
                  width: 162.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Unfollowed',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Last 7 days',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Metropolis',
                            fontSize: 10.0),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '82',
                        style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple,
                          Colors.deepPurple,
                          Colors.blueAccent
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ],
        ),
        _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU", 'Harris', 'Enathu'),
        _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Lf7wdlXTOR9yqBpWtuo2pid1EilQ0bxnRTSBZvPPkhlDBGlBQee7QraOponv6JSgf4c&usqp=CAU", 'Rahul', 'India'),
        _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCwHF4W1YpjtRVl3u_2lRnzrbqPwYSltyRzkGthXRmgQ&s", 'Mani', 'Los Angeles'),
        _followList("https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg", 'Rajpal', 'Newzealand'),
        _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXUdZHEIh62u6gLJUM4dybb83j4DzSD4zcKKfvmQkttAKaRY8qJskarlA7SWzaEE78KSg&usqp=CAU", 'Kim jung', 'Trivandrum'),
        _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-ngJBzgC87qJ4Bfp7kqULVMRhsxsALwaqjdIOzkoBxgBiDv7-8KwiupW3-D1lAtbbrw8&usqp=CAU", 'Gregory', 'Adoor'),
        _followList("https://thumbs.dreamstime.com/b/woman-laying-grass-5455137.jpg", 'Rahul', 'New York'),
        _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRM-s5JJFWxcD9623Xk8besdStfRp4YasZQy54dbeuyFEGGkTpTyIm1L_dyOxvxpuC03w&usqp=CAU", 'Devis', 'Kerala'),
        _followList("https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg", 'Ram', 'Jammu'),
        _followList("https://blog.photofeeler.com/wp-content/uploads/2017/09/instagram-profile-picture-maker.jpg", 'Edwin', 'India'),
        _followList("https://i.pinimg.com/736x/5d/e1/84/5de184caac6ed1ed08c1dcecabcd1fc8.jpg", 'Aswathy', 'Kovalam'),
        _followList("https://i.pinimg.com/originals/63/f9/d5/63f9d5fd5f34c8544a31c22c3e909cec.jpg", 'Pranav', 'Thiruvalla'),
        _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_oCSpNyceseWF8FaomiEv5k6QEfZq1Ck0HAFzFqFer7dIDYnU2l1IbDFbM8WmQLiL8Z4&usqp=CAU", 'Aswin', 'Pala'),
        // _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU", 'Devu', 'Chenganoor'),
        // _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU", 'Prakash', 'MAnnady'),
        // _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU", 'Athul', 'Korea'),
        // _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU", 'Rajiv', 'Washington'),
        // _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU", 'Mohanlal', 'AbuDhabi'),
        // _followList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP26cjkW6LqNqSJmP1qq-nmy112EdssG6AC7fV8JYvCD-oTcsGY0gtBYgFhVbCs2T3nnA&usqp=CAU", 'Sethupathi', 'Heaven'),
      ],
    );
  }
}
