import 'package:flutter/material.dart';
import 'package:symptomator/screens/main_screen.dart';

class NewUserScreen extends StatelessWidget {
  const NewUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _name = '';
    String _surname = '';
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Symptomator',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Vorname'),
                onChanged: (name) => _name = name,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nachname',
                ),
                onChanged: (name) => _surname = name,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  // User.createNewUser()
                  print('$_surname ,  $_name');
                  // Navigator.pushReplacementNamed(context, '/main');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(surName: _surname, name: _name)));
                },
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                child: const Text('ENTER'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
