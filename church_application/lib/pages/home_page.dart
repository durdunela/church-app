import 'package:church_application/widgets/custom_drawer.dart';
import 'package:church_application/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MainPage(),
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
      appBar: AppBar(
        title: const Text('Church Application'),
        backgroundColor: const Color(0xFFD5BB7E),
      ),
      drawer: const CustomDrawer(
        text: 'მთავარი',
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int itemCount = 5;

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          color: Colors.green,
          child: ListView.separated(
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                height: 80,
                color: Colors.white,
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '- სიახლეები -',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.blue,
          height: 200,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          '- დამატებითი სერვისი -',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          color: Colors.red,
          height: 200,
        ),
      ],
    );
  }
}
