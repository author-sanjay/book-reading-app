import 'package:flutter/material.dart';
import 'package:padhaku_reader/bookoverview/bookoverview.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  String bookImage;
  String pdfUrl;
  String bookSummary;
  String authorName;
  String bookName;
  int bookPrice;
  SingleItem({required this.isBool, required this.authorName, required this.bookImage, required this.bookName, required this.bookSummary, required this.pdfUrl, required this.bookPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 100,
            child: Center(
              child: Image.network(
                  bookImage),
            ),
          )),
          Expanded(
              child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      bookName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      authorName,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
          Expanded(
              child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
            child: isBool==false? Container(
              height: 25,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BookOverview(authorname: authorName, description: bookSummary, image: bookImage, name: bookName, pdfurl: pdfUrl, )),
                            );
                  }
                        
                  ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                      Text(
                        "Read Book",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ): Column(
              children: [
                Icon(Icons.delete, size: 30, color:  Colors.white,)
              ],
            )
          ),),
        ],
      ),
      
    );
  }
}
