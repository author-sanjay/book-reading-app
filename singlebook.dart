

import 'package:flutter/material.dart';

import '../bookoverview/bookoverview.dart';

class SingleBook extends StatelessWidget {
  final String bookImage;
  final String bookName;
  final String bookDescription;
  final String authorName;
  final String pdfUrl;
  final num bookPrice;

  SingleBook(
      {required this.bookImage,
      required this.authorName,
      required this.bookDescription,
      required this.bookName,
      required this.pdfUrl,
      required this.bookPrice,
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(right: 10),
                height: 230,
                width: 165,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BookOverview(
                                image: bookImage,
                                name: bookName,
                                authorname: authorName,
                                description: bookDescription, pdfurl: pdfUrl,),
                          ),
                        );
                      },
                      child: Container(
                        height: 230,
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        child: Image.network(bookImage),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}

