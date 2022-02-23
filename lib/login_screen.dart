import 'package:flutter/material.dart';
import 'package:login_add_screen_assignment/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Log In',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Username'),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8.0),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Password'),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8.0),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ),
                        );
                      },
                      child: const Text('Log in'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
