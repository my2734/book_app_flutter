import 'package:book_app2/constants/colors.dart';
import 'package:book_app2/pages/detail/widgets/book_cover.dart';
import 'package:book_app2/pages/detail/widgets/book_review.dart';
import 'package:flutter/material.dart';
import '../../models/book.dart';
import './widgets/book_detail.dart';
import './widgets/book_detail.dart';
import '../../NavBar.dart';
// import './widgets/book_comment.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              BookDetail(book),
              BookCover(book),
              BookReview(book),

              // Expanded(
              //   child: ListView(
              //     children: [
              //       Text("hello"),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
        // child: Column(
        //   children: <Widget>[
        //     BookDetail(book),
        //     BookCover(book),
        //     BookReview(book),
        //     BookComment(),
        //   ],
        // ),
      ),
       bottomNavigationBar: NavBar(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_outlined, color: kFont),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz_outlined,
            color: kFont,
          ),
        )
      ],
    );
  }
}
