import 'package:flutter/material.dart';

class SignupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: EdgeInsets.all(20.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration:
                    InputDecoration(labelText: 'მომხმარებლის სახელი/გვარი'),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'ტელეფონის ნომერი'),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'პაროლი'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle signup logic here
                },
                child: Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
