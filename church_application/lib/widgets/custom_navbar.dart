import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavbar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'მთავარი',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'ლოცვანი',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'ნაწარმი',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'სერვისი',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFD5BB7E),
      onTap: onItemTapped,
    );
  }
}
