import 'package:flutter/material.dart';
import 'package:padhaku_reader/screens/home_page.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  late final String bookName;

  late final String pdfUrl;

  PdfViewer({
    required this.bookName,
    required this.pdfUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://c0.wallpaperflare.com/preview/300/745/186/gradient-sky-moon-sunset.jpg"),
            fit: BoxFit.fitHeight,
          )),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
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
                title: Text(bookName),
              ),
              body: Container(
                  child: SfPdfViewer.network(
                pdfUrl,
                enableDoubleTapZooming: false,
              ))),
        ),
      ],
    );
  }
}
