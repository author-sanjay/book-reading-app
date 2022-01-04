import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:padhaku_reader/models/book_model.dart';

class BookProvider with ChangeNotifier {
  late BookModel bookModel;
  List<BookModel> search = [];

  bookModels(QueryDocumentSnapshot element) {
    bookModel = BookModel(
        bookImage: element.get("bookImage"),
        bookPrice: element.get("bookPrice"),
        bookName: element.get("bookName"),
        aboutBook: element.get("bookSummary"),
        pdfUrl: element.get("pdfUrl"),
        authorName: element.get("authorName"));
    search.add(bookModel);
  }

/////////////////////////Top Rated///////////////////////////////////////////////
  List<BookModel> topRatedBookList = [];

  fetchTopratedBookData() async {
    List<BookModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("TopRatedBook").get();

    value.docs.forEach(
      (element) {
        bookModel = BookModel(
          aboutBook: element.get("bookSummary"),
          authorName: element.get("authorName"),
          bookName: element.get("bookName"),
          bookPrice: element.get("bookPrice"),
          pdfUrl: element.get("pdfUrl"),
          bookImage: element.get("bookImage"),
        );

        newList.add(bookModel);

        //bookModel=BookModel(
      },
    );
    topRatedBookList = newList;
    notifyListeners();
  }

  List<BookModel> get gettopRatedBookDataList {
    return topRatedBookList;
  }

//////////////////////////////// High Paying///////////////////////////////////////

  List<BookModel> highPayingList = [];

  fetchHighPayingData() async {
    List<BookModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HighPaying").get();

    value.docs.forEach(
      (element) {
        bookModels(element);

        newList.add(bookModel);

        //bookModel=BookModel(
      },
    );
    highPayingList = newList;
    notifyListeners();
  }

  List<BookModel> get gethighPayingList {
    return highPayingList;
  }

/////////////////////////////Study And Earn////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
  List<BookModel> get gerAllBookSearch {
    return search;
  }
}
