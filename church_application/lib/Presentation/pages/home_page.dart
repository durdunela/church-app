import 'package:flutter/material.dart';
import 'package:church_application/Presentation/models/calendar_model.dart';
import 'package:church_application/Presentation/widgets/custom_drawer.dart';
import 'package:church_application/Presentation/widgets/custom_navbar.dart';

import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<CalendarModel> calendar = [];

  @override
  void initState() {
    super.initState();
    _getCalendar();
  }

  void _getCalendar() {
    setState(() {
      calendar = CalendarModel.getCalendar();
    });
  }

  List<Widget> get _pages => [
        MainPage(calendar: calendar),
        Center(child: Text('ლოცვანი')),
        Center(child: Text('ნაწარმი')),
        Center(child: Text('სერვისი')),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Church Application'),
        backgroundColor: const Color(0xFFD5BB7E),
      ),
      drawer: const CustomDrawer(text: 'მთავარი'),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
