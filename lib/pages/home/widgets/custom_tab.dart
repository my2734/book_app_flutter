import 'package:book_app2/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final int selected;
  final Function callback;
  CustomTab(this.selected, this.callback, {super.key});
  final tabs = ['Book', 'Story'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: 56,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => {callback(index)},
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            width: (width - 40) / 2 - 10,
            decoration: BoxDecoration(
              color: selected == index ? Colors.white : Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: kFont,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(
          width: 10,
        ),
        itemCount: tabs.length,
      ),
    );
  }
}
