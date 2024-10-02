import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/home_page.svg',
            width: 24,
            height: 24,
          ),
          label: 'მთავარი',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/prayers.svg',
            width: 24,
            height: 24,
          ),
          label: 'ლოცვანი',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/goods.svg',
            width: 24,
            height: 24,
          ),
          label: 'ნაწარმი',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/services.svg',
            width: 24,
            height: 24,
          ),
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
