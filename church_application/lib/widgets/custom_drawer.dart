import 'package:church_application/pages/church_calendar.dart';
import 'package:church_application/pages/home_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_outlined),
            title: const Text(
              'სიახლეები',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_outlined),
            title: const Text(
              'საეკლესიო კალენდარი',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'ლოცვანი',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'ქადაგებები',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'საეკლესიო რუკა',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'სამონასტრო ნაწარმი',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'მომლოცველობითი ტურები',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'მაცნე - კითხვა მამაოსთან',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'ლიტერატურა',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'შესაწირი / პროექტები',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text(
              'ჩვენს შესახებ',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChurchCalendar()));
            },
          ),
        ],
      ),
    );
  }
}
