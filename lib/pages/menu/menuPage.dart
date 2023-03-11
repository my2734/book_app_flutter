import 'package:flutter/material.dart';
import '../../NavBar.dart';
import '../../models/book.dart';
import '../detail/detail.dart'; 

class MenuPage extends StatelessWidget {
  final String status;
  const MenuPage({required this.status, super.key});
  // final String status;
  @override
  Widget build(BuildContext context) {
  // final String status = 'All';
    List<Book> bookList = Book.generateBooks();
    String heading = 'All Book';
    if(status == 'All'){
      bookList = Book.generateBooks();
    }else{
      bookList.removeWhere((filmItem) => filmItem.typeId != status);
      if(bookList.length ==0 ){
        heading = 'Không tìm thấy sách';
      }else{
        heading = bookList[0].types.toString();
      }
    }

    return Scaffold(
      body:  SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 35,
                          ),
                        ),
                    SizedBox(
                      height: 30
                    ),
                    Text('${heading}', style: TextStyle( fontSize: 30, fontWeight: FontWeight.w500,),),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10,),
                  child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2/ 3.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20
                  ),
                  itemCount: bookList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                    onTap: () {
                      // print(id);
                      Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => DetailPage(bookList[index])));
                    },
                  child: Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            bookList[index].imgUrl,
                            height: 200,
                            width: 200,
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
            ),
                )
              )
             
            ],
          ),
       ),
      bottomNavigationBar: NavBar(),
    );
  }
}
