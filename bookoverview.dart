import 'package:flutter/material.dart';
import 'package:padhaku_reader/pdf/viewpdf.dart';
import 'package:padhaku_reader/screens/home_page.dart';

class BookOverview extends StatefulWidget {
  final String image;
  final String name;
  final String authorname;
  final String description;
  final String pdfurl;
  
  BookOverview(
      {required this.image,
      required this.name,
      required this.authorname,
      required this.description,
      required this.pdfurl});

  @override
  _BookOverviewState createState() => _BookOverviewState();
}

class _BookOverviewState extends State<BookOverview> {
  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required Function onTap,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color(0xFF413256),
          bottomNavigationBar: Row(
            children: [
              Container(
                width: 20,
                child: GestureDetector(
                   onTap: (){
                        Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PdfViewer(bookName: widget.name, pdfUrl: widget.pdfurl,),
                                      ),
                                    );
                      },
                  child: bonntonNavigatorBar(
                      backgroundColor: Color(0xFFd46f15),
                      color: Colors.white,
                      iconColor: Colors.white,
                      title: "Read Book",
                      iconData: Icons.book,
                      onTap: (){}
                     
                    ),
                ),
              ),
              
              Container(
                width: 339,
                child: GestureDetector(
                  
                    onTap: (){
                        
                     Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PdfViewer(bookName: widget.name, pdfUrl: widget.pdfurl,),
                                        ),
                                      );
                  },
                  child: bonntonNavigatorBar(
                    
                      backgroundColor: Color(0xFFd46f15),
                      color: Colors.white,
                      iconColor: Colors.white,
                      title: "Read And Earn (Membership required)",
                      
                      iconData: Icons.monetization_on_outlined, onTap: (){}
                                    
                        ),
                ),
              ),
                  
            ],
          ),
          appBar: AppBar(
            title: Text("Book Overview"),
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 350,
                      width: 230,
                      color: Colors.transparent,
                      child: Card(
                        child: Container(
                          
                          height: 230,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(widget.image),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.name,
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.authorname,
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 200,
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          "   Description",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 50,),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                         
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 500,),
                ],
              ),
            ),
          ),
        );
      
  }
}
