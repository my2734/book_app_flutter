import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import './widgets/custom_tab.dart';
import './widgets/book_staggered_gridview.dart';
import '../../NavBar.dart';
import '../menu/resultPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final TextEditingController _searchController = TextEditingController();
  var tabIndex = 0;
  var bottomIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SafeArea(

          child:  Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Welcome BookApp', style: TextStyle(color: kFont, fontSize: 30, fontWeight: FontWeight.w500)),
                  ),
                  ClipRRect(
                    child: Image.asset('assets/images/profile.png', height: 50, width: 50)
                  )
                ],
              ),
            ),
           Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical : 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              children: [                  
                Container( 
                  padding: EdgeInsets.only(left: 20),                 
                  width: 300,                   
                  child: TextField(
                  controller: _searchController,
                  style: TextStyle(fontSize: 18, color: kFont),
                  decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                    Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultPage(search: _searchController.text),
                    ));
                    // _searchControll.clear();
                  },
                  child:  Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                  ),
                 )
                ],
              ),
           ),
            CustomTab(tabIndex, (int index) {
              setState(() {
                tabIndex = index;
              });
              pageController.jumpToPage(index);
            }),
            Expanded(
              child: BookStaggerGridView(
                tabIndex,
                pageController,
                (int index) => setState(
                  () {
                    tabIndex = index;
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar()
    );
  }

  // Widget buildBottomNavigationBar() {
   
  //   final width = MediaQuery.of(context).size.width;
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     width: MediaQuery.of(context).size.width,
  //     height: 56,
  //     decoration: BoxDecoration(
  //       color: Colors.grey[300],
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(30),        
  //         topRight: Radius.circular(30),        
  //       )
  //       // color: Colors.black,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           child: Icon(Icons.home, size: 30)
  //         ),
  //          Container(
  //           child: Icon(Icons.grid_view, size: 30)
  //         ),
  //          Container(
  //           child: Icon(Icons.menu, size: 30)
  //         ),
  //          Container(
  //           child: Icon(Icons.logout_outlined, size: 30)
  //         ),
  //       ]
  //     )
  //   );
  // }


}
