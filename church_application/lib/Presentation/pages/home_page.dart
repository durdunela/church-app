import 'package:church_application/Presentation/models/calendar_model.dart';
import 'package:church_application/Presentation/widgets/custom_drawer.dart';
import 'package:church_application/Presentation/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<CalendarModel> calendar = [];

  void _getCalendar() {
    setState(() {
      calendar = CalendarModel.getCalendar();
    });
  }

  @override
  void initState() {
    super.initState();
    _getCalendar();
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
  final List<CalendarModel> calendar;

  const MainPage({super.key, required this.calendar});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: ListView.separated(
              itemCount: calendar.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          calendar[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      child: Text(
                        calendar[index].name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'სიახლეები',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.blue,
            height: 250,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'დამატებითი სერვისი',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            color: Colors.red,
            height: 200,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'საკითხავი ლიტერატურა',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            color: Colors.orange,
            height: 100,
          ),
        ],
      ),
    );
  }
}
