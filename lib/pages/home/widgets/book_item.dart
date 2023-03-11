// import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../models/book.dart';
import '../../detail/detail.dart';
// import './postmode.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class BookItem extends StatefulWidget {
  final Book book;
  const BookItem(this.book, {super.key});

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  // List<PostModel> listPostModel = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Future getRequest() async {
  //     String url = "https://jsonplaceholder.typicode.com/posts";
  //     final response = await http.get(Uri.parse(url));
  //     var responseData = json.decode(response.body);
  //     for (var i = 0; i < responseData.length; i++) {
  //       PostModel post_item = PostModel(
  //           responseData[i]['id'],
  //           responseData[i]['userId'],
  //           responseData[i]['title'],
  //           responseData[i]['body']);
  //       listPostModel.add(post_item);
  //     }
  //   }

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // print(listPostModel.length);
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   print("hello ca nha yeu");
        // });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(widget.book),
          ),
        );
      },
      child: Container(
        height: widget.book.height as double,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.book.imgUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
