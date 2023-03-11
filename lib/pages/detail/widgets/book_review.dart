import 'dart:convert';

import 'package:book_app2/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../models/book.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../models/comment.dart';
import '../../../models/book.dart';
import '../detail.dart';
import '../../menu/menuPage.dart';

class BookReview extends StatefulWidget {
  final Book book;
  const BookReview(this.book, {super.key});

  @override
  State<BookReview> createState() => _BookReviewState();
}

class _BookReviewState extends State<BookReview> {
  String status = 'Submit';
  TextEditingController _commentController = TextEditingController();
  List<Comment> commentList = [];
  String commentId = '';

  

  @override
  initState() {
    super.initState();
    // TODO: implement initState
    commentList = Comment.generateComments();
    commentList.removeWhere((commentItem)=> commentItem.idBook != widget.book.id);
    status = 'Submit';


  }

  @override
  Widget build(BuildContext context) {
  List<Book> bookList = Book.generateBooks();
  bookList.removeWhere((bookItem)=> bookItem.typeId != widget.book.typeId);
  bookList.removeWhere((bookItem)=> bookItem.id == widget.book.id);



  final user = FirebaseAuth.instance.currentUser;
  // print(user?.email);

  // print(commentList.length);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${widget.book.score}',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _builderStar(),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${widget.book.rating} Ratings on Google Play',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: widget.book.review,
                  style: const TextStyle(
                    color: kFont,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                TextSpan(
                  text: ' Read more',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.w500, 
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
           
          Column(
            children: [
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Recommended', style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.w500,)
              ),
              InkWell(
                onTap: (){
                  String catId = widget.book.typeId;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuPage(status: catId)));
                },
                child: Text('See All', style: TextStyle(
                   fontSize: 16, 
                  ),
                ),
              )
          ],
        ),
      ),
      SizedBox(height: 15),
      Container(
        height: 200,
        // color: Colors.grey[200],
        child: ListView.builder(
           scrollDirection: Axis.horizontal,
          itemCount: bookList.length,
          itemBuilder: (BuildContext context, int index){
            return InkWell(
                    onTap: () {
                      // print(id);
                      Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => DetailPage(bookList[index])));
                    },
                  child: Container(
                    width: 150,
                  margin: EdgeInsets.only(left: 10),
                    // height: 300,
                    // width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xFF292B37),
                      // color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF292B38).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 6,
                          // Color
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            bookList[index].imgUrl,
                            height: 100,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${bookList[index].name}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${bookList[index].types}',
                                style: TextStyle(
                                  color: Colors.white54,
                                  overflow: TextOverflow.ellipsis
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                               padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Icon(Icons.star, color: Colors.amber),
                                  Text('View: ', style: TextStyle(color: Colors.amber)),
                                  SizedBox(width: 5),
                                  Text(
                                    '${bookList[index].rating}',
                                      style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),             
          
              );
          }
        )
      ),      
     ],
    ),
    SizedBox(height: 10),
          Text(
            'Comment',
            style: TextStyle(
                color: kFont, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Color(0xffCED0D2),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            // padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
            child: SizedBox(
              width: 100,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                    if(status == 'Submit'){
                      setState((){
                      String id = DateTime.now().millisecondsSinceEpoch.toString();
                      String content = _commentController.text.toString();

                      Comment newComment = new Comment(id, widget.book.id, '${user?.email}', _commentController.text);
                      commentList.add(newComment);
                    });
                  }else{
                    int index = 0;
                    for(int i = 0; i< commentList.length; i++){
                      if(commentId == commentList[i].id){
                        index = i;
                      }
                    }
                      setState((){
                        commentList[index].content = _commentController.text;
                        status = 'Submit';
                      });
                  }
                  

                  _commentController.clear();

                 
                },
                child: Text(
                  status=='Submit'?"Submit":"Update",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 500,
            child: ListView.builder(
              itemCount: commentList.length,
              itemBuilder: (BuildContext context,int index){
                return ListTile(
                    leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Image.asset('assets/images/ic_user.png'),
                          ),
                        ]),
                    title: Text(
                      commentList[index].emailUser,
                      style: TextStyle(
                          color: kFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(commentList[index].content,
                        style: TextStyle(fontSize: 15)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.delete_outlined),
                          onTap: (){
                            setState((){
                              commentList.removeWhere((commentItem) => commentItem.id == commentList[index].id );
                            });
                          },
                        ),
                        GestureDetector(
                          child: Icon(Icons.edit),
                          onTap: (){
                            setState((){
                              _commentController.text = commentList[index].content.toString();
                              status = 'Update';
                              commentId = commentList[index].id;
                              // print(commentList[index].id);
                            });
                          },
                        ),
                      ],
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderStar() {
    final List<Color> color = [
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.grey.withOpacity(0.3),
    ];

    return Row(
      children: color
          .map(
            (e) => Icon(Icons.star, size: 25, color: e),
          )
          .toList(),
    );
  }
}
