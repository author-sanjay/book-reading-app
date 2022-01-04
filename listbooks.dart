import 'package:flutter/material.dart';
import 'package:padhaku_reader/providers/book_provider.dart';
import 'package:padhaku_reader/screens/home_page.dart';
import 'package:padhaku_reader/screens/singlebook.dart';
import 'package:provider/provider.dart';
import 'singlebook.dart';

class ListBook extends StatefulWidget {
  final String name;
  ListBook({required this.name});

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {

  @override
  void initState(){
    BookProvider bookProvider = Provider.of(context,listen: false);
    bookProvider.fetchTopratedBookData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookProvider bookProvider = Provider.of(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/images/appbackground.jpg'), fit: BoxFit.fitHeight)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  }),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://c0.wallpaperflare.com/preview/300/745/186/gradient-sky-moon-sunset.jpg"),
                      fit: BoxFit.fitHeight)),
              child: ListView(
                children: [
                  SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Column(
                        children: [
                          Container(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "   ${widget.name}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 700,
                        child: GridView.count(
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                          children: <Widget>[
                            SingleBook(
                              bookImage:
                                  "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1588286863l/634583._SY475_.jpg",
                              authorName: 'APJ Kalam',
                              bookDescription:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              bookName: 'Wings Of Fire',
                              bookPrice: 130,
                              pdfUrl: '',
                            ),
                            SingleBook(
                              bookImage:
                                  "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1588286863l/634583._SY475_.jpg",
                              authorName: 'APJ Kalam',
                              bookDescription:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              bookName: 'Wings Of Fire',
                              bookPrice: 130,
                              pdfUrl: '',
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
