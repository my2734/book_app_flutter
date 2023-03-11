import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../models/book.dart';
import './book_item.dart';

class BookStaggerGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;
  BookStaggerGridView(this.selected, this.pageController, this.callback,
      {super.key});

  List<Book> bookList = Book.generateBooks();
  List<Book> storyList = Book.generateBooks();
  

  @override
  Widget build(BuildContext context) {
  bookList.removeWhere((bookItem)=> bookItem.typeId == '8');
  storyList.removeWhere((bookItem)=> bookItem.typeId != '8');
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: [
          Container(
            child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 4,
              itemCount: bookList.length,
              itemBuilder: (context, index) => BookItem(bookList[index]),
              staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
            ),
          ),
          Container(
            child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 4,
              itemCount: storyList.length,
              itemBuilder: (context, index) => BookItem(storyList[index]),
              staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
            ),
          ),
          // Container(),
        ],
      ),
    );
  }
}
