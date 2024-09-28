import 'package:church_application/pages/login_card.dart';
import 'package:church_application/pages/singup_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Church App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  'assets/church_app.svg',
                  height: 140,
                ),
              ),
              PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Container(
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'მაცნე',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TabBar(
                tabs: const [
                  Tab(text: 'ავტორიზაცია'),
                  Tab(text: 'რეგისტრაცია'),
                ],
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey,
              ),
              Expanded(
                child: Builder(
                  builder: (BuildContext context) {
                    final TabController tabController =
                        DefaultTabController.of(context);

                    return TabBarView(
                      children: [
                        LoginCard(
                          onSwitchToSignUp: () {
                            tabController.animateTo(1);
                          },
                        ),
                        SignupCard(
                          onSwitchToSignIn: () {
                            tabController.animateTo(0);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
