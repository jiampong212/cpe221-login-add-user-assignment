import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_add_screen_assignment/database_api.dart';
import 'package:login_add_screen_assignment/home_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static final TextEditingController _userNamecontroller = TextEditingController();
  static final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  TextField(
                    controller: _userNamecontroller,
                    decoration: const InputDecoration(
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
                  TextField(
                    controller: _passwordcontroller,
                    decoration: const InputDecoration(
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
                      onPressed: () async {
                        if (!await DatabaseAPI().login(
                          _userNamecontroller.text.trim(),
                          _passwordcontroller.text.trim(),
                        )) return;

                        await ref.read(userListProvider.notifier).init();

                        _userNamecontroller.clear();
                        _passwordcontroller.clear();

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
