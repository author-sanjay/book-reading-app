import 'package:flutter/material.dart';
import 'package:padhaku_reader/models/user_model.dart';
import 'package:padhaku_reader/t_cs/terms.dart';
import 'package:url_launcher/url_launcher.dart';


const _url = 'https://rzp.io/l/padhakumembership';
const _url2 = 'https://lifebadlegi.com/my-account/';
const _url3 = 'https://lifebadlegi.com/my-account/';
const _url5 = 'mailto:wallet@lifebadlegi.com?subject=Withdraw%20Money';
class MyProfile extends StatefulWidget {
  UserModel userData;
  MyProfile({required this.userData});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF413256),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.transparent,
              ),
              Container(
                height: 548,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            width: 250,
                            height: 180,
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      widget.userData.userName,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(widget.userData.userEmail,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector( onTap: (){
                      
                      _launchURL();
                    },
                      child: listTile(
                          icon: Icons.monetization_on_rounded,
                          title: "Renew MemberShip"),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      
                      _launchURL2();
                    
                      },
                      child: listTile(
                          icon: Icons.account_balance_wallet_outlined,
                          title: "Earning (Check)"),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      
                        _launchURL5();
                    
                      },
                      child: listTile(
                          icon: Icons.account_balance_wallet_outlined,
                          title: "Earning (Withdraw)"),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => TermsAndConditions()));
                        },
                        child: listTile(
                            icon: Icons.file_copy_outlined,
                            title: "Terms And Conditions")),
                    GestureDetector(
                      onTap: (){
                        _launchURL3();
                      },
                      child: listTile(
                          icon: Icons.policy_outlined, title: "Privacy Policies"),
                    ),
                    
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 130),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Color(0xFF413256),
                radius: 45,
                backgroundImage: NetworkImage(widget.userData.userImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

void _launchURL2() async =>
    await canLaunch(_url2) ? await launch(_url2) : throw 'Could not launch $_url2';

void _launchURL3() async =>
    await canLaunch(_url3) ? await launch(_url3) : throw 'Could not launch $_url3';

void _launchURL5() async =>
    await canLaunch(_url5) ? await launch(_url5) : throw 'Could not launch $_url5';