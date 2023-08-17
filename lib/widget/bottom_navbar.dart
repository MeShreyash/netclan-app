import 'package:flutter/material.dart';

import '../main.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavBarTab> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () {
              onTap(index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item.page),
              );
            }, //=> onTap(index),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Icon(
                    item.icon,
                    color: isSelected ? appBarColor : Colors.grey,
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.label,
                    style: TextStyle(
                      color: isSelected ? appBarColor : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BottomNavBarTab {
  final IconData icon;
  final String label;
  final Widget page;

  BottomNavBarTab(
    this.icon,
    this.label,
    this.page,
  );
}
