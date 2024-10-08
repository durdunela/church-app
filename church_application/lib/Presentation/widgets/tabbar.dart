import 'package:church_application/Presentation/pages/login_card.dart';
import 'package:church_application/Presentation/pages/singup_card.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void switchToSignIn() {
    _tabController.animateTo(1);
  }

  void switchToSignUp() {
    _tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Sign Up'),
            Tab(text: 'Sign In'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SignupCard(onSwitchToSignIn: switchToSignIn),
          LoginCard(onSwitchToSignUp: switchToSignUp),
        ],
      ),
    );
  }
}
