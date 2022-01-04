import 'package:flutter/material.dart';
import 'package:padhaku_reader/providers/user_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'my profile/myprofile.dart';

const _url4 = 'https://lifebadlegi.com/my-account/';
const _url6 = 'mailto:books@lifebadlegi.com?subject=Please%20add%20this%20book';
const _url10 =
    'https://docs.google.com/spreadsheets/d/1-PEjhyxwZpNAVcrCJoIv473rTdrCYaxShCeomcTNfAA/edit?usp=sharing';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;

  DrawerSide({required this.userProvider});
  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF413256)),
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          userData.userImage,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData.userName,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          userData.userEmail,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(
                      userData: userData,
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchURL4();
              },
              child: ListTile(
                leading: Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                ),
                title: Text(
                  "My Wallet",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchURL6();
              },
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.white,
                ),
                title: Text(
                  "Request Book",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchURL10();
              },
              child: ListTile(
                leading: Icon(
                  Icons.leaderboard,
                  color: Colors.white,
                ),
                title: Text(
                  "Opportunities",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Text(
                    "    Contact Support",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("    Call Us:        ",
                          style: TextStyle(color: Colors.white)),
                      Text("01141731389",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.left)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("    Email Us:     ",
                          style: TextStyle(color: Colors.white)),
                      Text("thepadhakuapp@gmail.com",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.left)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _launchURL4() async => await canLaunch(_url4)
    ? await launch(_url4)
    : throw 'Could not launch $_url4';

void _launchURL6() async => await canLaunch(_url6)
    ? await launch(_url6)
    : throw 'Could not launch $_url6';

void _launchURL10() async => await canLaunch(_url10)
    ? await launch(_url10)
    : throw 'Could not launch $_url6';
