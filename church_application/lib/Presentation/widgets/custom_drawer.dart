import 'package:church_application/Presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String text;

  const CustomDrawer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFD7CCBA),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFD7CCBA),
              ),
              child: Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            _buildListTileWithDivider('სიახლეები', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('საეკლესიო კალენდარი', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('ლოცვანი', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('ქადაგებები', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('საეკლესიო რუქა', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('სამონასტრო ნაწარმი', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('მომლოცველობითი ტურები', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('მაცნე - კითხვა მამაოსთან', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('ლიტერატურა', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('შესაწირი / პროექტები', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            _buildListTileWithDivider('ჩვენს შესახებ', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildListTileWithDivider(String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.arrow_forward_ios_outlined),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          onTap: onTap,
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
