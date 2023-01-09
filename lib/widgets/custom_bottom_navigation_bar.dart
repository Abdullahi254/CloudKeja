import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.onSelected})
      : super(key: key);
  final Function(int i)? onSelected;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final bottomBarItems = [
    'home',
    'home_search',
    'notification',
    'home_mark',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomBarItems
            .map(
              (item) => InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = bottomBarItems.indexOf(item);
                    widget.onSelected!(bottomBarItems.indexOf(item));
                  });
                },
                child: SvgPicture.asset(
                  'assets/icons/$item.svg',
                  color: selectedIndex == bottomBarItems.indexOf(item)
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}