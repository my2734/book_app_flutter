import 'package:book_app2/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../models/book.dart';
import 'package:intl/intl.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    // print(book.publisher);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.types.toUpperCase(),
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            book.name,
            style: TextStyle(
              fontSize: 24,
              color: kFont,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Publish form ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  // Text(
                  //   book.publisher,
                  //   style: TextStyle(
                  //     color: kFont,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
              Text(DateFormat.yMMMd().format(book.date),
                  style: TextStyle(
                    color: Colors.grey,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
