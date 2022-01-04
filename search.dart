import 'package:flutter/material.dart';
import 'package:padhaku_reader/models/book_model.dart';
import 'package:padhaku_reader/screens/home_page.dart';
import 'package:padhaku_reader/widgets/single_item.dart';

class Search extends StatefulWidget {
 final List<BookModel>search; 
 Search({required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String query = "";


searchItem(String query){
List<BookModel> searchbook = widget.search.where((element){
  return element.bookName.toLowerCase().contains(query);
}).toList();
return searchbook;
}


  
  @override
  Widget build(BuildContext context) {
    List<BookModel> _searchItem = searchItem(query);
    return 
           Scaffold(
            backgroundColor: Color(0xFF413256),
            appBar: AppBar(
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
              title: Text(
                "Search",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
            body: ListView(
              children: [
                ListTile(
                  title: Text(
                    "Books",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 52,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query= value;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: "Search Book",
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        focusColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: _searchItem.map((data){
                    return SingleItem(isBool: false,
                    bookImage: data.bookImage,
                    bookName: data.bookName,
                    authorName: data.authorName,
                    bookSummary: data.aboutBook,
                    pdfUrl: data.pdfUrl,
                    bookPrice: data.bookPrice,
                    );
                  }).toList(),
                    
                  
                )
                
              ],
            ),
          );
  }
      
  }

