import 'package:church_application/Presentation/pages/login_card.dart';
import 'package:church_application/Presentation/pages/singup_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Church App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
              const Center(
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
              const SizedBox(height: 16),
              Container(
                height: 60,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xFFAA925C),
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'ავტორიზაცია',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'რეგისტრაცია',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                  labelColor: Colors.white,
                  indicatorColor: Colors.transparent,
                  indicatorWeight: 0,
                ),
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
