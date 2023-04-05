import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  List<BottomNavigationBarItem> listBarItem;
  var onTapIndex;
  int currentIndex;

  CustomBottomNavigationBar({Key? key, required this.listBarItem, required this.onTapIndex, required this.currentIndex}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: widget.onTapIndex,
      currentIndex: widget.currentIndex,
      items: widget.listBarItem,
    );
  }
}
