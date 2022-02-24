import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_add_screen_assignment/database_api.dart';
import 'package:login_add_screen_assignment/home_screen.dart';

class AddUser extends ConsumerStatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddUserState();
}

class _AddUserState extends ConsumerState<AddUser> {
  static final TextEditingController _confirmPasswordController = TextEditingController();
  static final TextEditingController _firstNameController = TextEditingController();
  static final TextEditingController _lastNameController = TextEditingController();
  static final TextEditingController _passwordController = TextEditingController();
  static final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.clear();
    _lastNameController.clear();
    _userNameController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 600,
        width: 500,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add User',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 29,
                ),
                const Text('Username'),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    hintText: 'required',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('First Name'),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'required',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Last Name'),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    hintText: 'required',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'required',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Confirm Password'),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'required',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    ElevatedButton(
                      onPressed: () async {
                        if (_userNameController.text.isEmpty ||
                            _firstNameController.text.isEmpty ||
                            _lastNameController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _confirmPasswordController.text.isEmpty) {
                          EasyLoading.showError('Required text fields cannot be empty');

                          return;
                        }

                        if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
                          EasyLoading.showError('Passwords do not match');
                          return;
                        }

                        try {
                          await DatabaseAPI().insertUser(
                            firstName: _firstNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            userName: _userNameController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                          ref.read(userListProvider.notifier).reset();

                          Navigator.pop(context);
                        } catch (e) {
                          return;
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
