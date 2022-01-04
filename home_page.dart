import 'package:flutter/material.dart';
import 'package:padhaku_reader/providers/book_provider.dart';
import 'package:padhaku_reader/providers/bookprovider.dart';
import 'package:padhaku_reader/providers/user_provider.dart';
import 'package:padhaku_reader/screens/drawer.dart';
import 'package:padhaku_reader/screens/singlebook.dart';
import 'package:padhaku_reader/search/search.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  late BookProvider bookProvider;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BookProvider bookProvider = Provider.of(context, listen: false);
    bookProvider.fetchTopratedBookData();
    bookProvider.fetchHighPayingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookProviderM bookProviderM = Provider.of(context);
    BookProvider bookProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();

    return Scaffold(
        backgroundColor: Color(0xFF413256),
        drawer: DrawerSide(
          userProvider: userProvider,
        ),
        
        appBar: AppBar(
          elevation: 0.7,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Padhaku",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 210,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: <Widget>[
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: Column(children: <Widget>[
                        Image(image: AssetImage("assets/images/appheader.jpg"))
                      ]),
                    ),
                  ]),
                ),
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "   Academic Books",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Search(
                                  search: bookProvider.gettopRatedBookDataList,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Search More   ",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: bookProvider.gettopRatedBookDataList
                        .map((topRatedBookData) {
                      return SingleBook(
                        bookImage: topRatedBookData.bookImage,
                        authorName: topRatedBookData.authorName,
                        bookDescription: topRatedBookData.aboutBook,
                        bookName: topRatedBookData.bookName,
                        bookPrice: topRatedBookData.bookPrice,
                        pdfUrl: topRatedBookData.pdfUrl,
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "   High Paying",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Search(
                                    search: bookProvider.gethighPayingList),
                              ),
                            );
                          },
                          child: Text(
                            "Search More   ",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: bookProvider.gethighPayingList
                        .map((highPayingBookData) {
                      return SingleBook(
                        bookImage: highPayingBookData.bookImage,
                        authorName: highPayingBookData.authorName,
                        bookDescription: highPayingBookData.aboutBook,
                        bookName: highPayingBookData.bookName,
                        bookPrice: highPayingBookData.bookPrice,
                        pdfUrl: highPayingBookData.pdfUrl,
                      );
                    }).toList(),
                  ),
                ),
                // Container(
                //   height: 70,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Text(
                //         "   Study And Earn",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       GestureDetector(
                //           onTap: () {
                //             Navigator.of(context).pushReplacement(
                //               MaterialPageRoute(
                //                 builder: (context) =>
                //                     Search(search: bookProvider.gerAllBookSearch),
                //               ),
                //             );
                //           },
                //           child: Text(
                //             "See More",
                //             style: TextStyle(color: Colors.white),
                //           )),
                //     ],
                //   ),
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(

                //     children: bookProviderM.getstudyAndEarn.map((studyAndEarn){

                //       return SingleBook(
                //         bookImage:
                //             studyAndEarn.bookImage,
                //         authorName: studyAndEarn.authorName,
                //         bookDescription:
                //             studyAndEarn.aboutBook,
                //         bookName: studyAndEarn.bookName, bookPrice: studyAndEarn.bookPrice, pdfUrl: studyAndEarn.pdfUrl,
                //       );

                //     }).toList(),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}


