import 'package:flutter/material.dart';
import './pages/menu/menuPage.dart';
import './pages/home/home.dart';
import './pages/category/categoryPage.dart';
import './models/book.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './pages/login/login_page.dart';
class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Book book = Book(
        '30',
        '11',
        'Thiếu nhi',
        'Bạn Tôi Là Người Ngoài Hành Tinh',
        DateTime(2019, 3, 23),
        'assets/images/sach30.jpg',
        6.0,
        600,
        'Một hôm, lớp học của hai cô bé Manju và Yoko xuất hiện một bạn học sinh mới, điều kỳ lạ là cậu tạ nói mình đến từ một hành tinh xa xôi ngoài vũ trụ. Mọi người rất ngạc nhiên, chẳng ai biết cậu ta định làm gì nữa. Bị tò mò thôi thúc, Manju và Yoko quyết định làm thân với cậu học sinh mới. để rồi từ đó hai cô bé khám phá ra một thế giới thật khác với bao điều lạ lẫm, và cùng nhau, họ đã học được những bài học quan trọng về tình bạn, sự quan tâm, sẻ chia cũng như sức mạnh diệu kỳ của trí tưởng tượng.',
        220.0,
      );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      // height: 56,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),        
          topRight: Radius.circular(30),        
        )
        // color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            },
            child: Container(
              child: Icon(Icons.home, size: 30)
            ),
          ),
           InkWell(
            onTap:(){
              String status = 'All';
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuPage(status: 'All')));
            },
            child: Container(
            child: Icon(Icons.grid_view, size: 30)
            ),
           ),
          InkWell(
             onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryPage()));
            },
            child: Container(
            child: Icon(Icons.menu, size: 30)
            ),
          ),
           InkWell(
            onTap: () async{
              await FirebaseAuth.instance.signOut();
             
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
            },
            child: Container(
            child: Icon(Icons.logout_outlined, size: 30)
          ),
           )
        ]
      )
    );
  }
}
