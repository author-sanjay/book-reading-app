import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:padhaku_reader/models/bookModel.dart';

class BookProviderM with ChangeNotifier {
  late BookModelM bookModelM;
  List<BookModelM> studyAndEarn = [];

  fetchStudyAndEarn() async {
    List<BookModelM> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("StudyAndEarn").get();

    value.docs.forEach(
      (element) {
        bookModelM = BookModelM(aboutBook: element.get("bookSummary"), authorName: element.get("authorName"), bookName: element.get("bookName"), bookPrice: element.get("bookPrice"), pdfUrl: element.get("pdfUrl"), bookImage: element.get("bookImage"),);

        newList.add(bookModelM);

        //bookModel=BookModel(
      },
    );
    studyAndEarn = newList;
    notifyListeners();
  }

  List<BookModelM> get getstudyAndEarn {
    return studyAndEarn;
  }
}