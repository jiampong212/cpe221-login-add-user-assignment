import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_add_screen_assignment/database_api.dart';
import 'package:login_add_screen_assignment/home_screen.dart';
import 'package:login_add_screen_assignment/user_data_class.dart';

class EditUser extends ConsumerStatefulWidget {
  const EditUser({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditUserState();
}

class _EditUserState extends ConsumerState<EditUser> {
  static final TextEditingController _firstNameController = TextEditingController();
  static final TextEditingController _lastNameController = TextEditingController();
  static final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.clear();
    _lastNameController.clear();
    _userNameController.clear();
    super.dispose();
  }

  @override
  void initState() {
    _userNameController.text = widget.user.userName;
    _userNameController.selection = TextSelection.fromPosition(TextPosition(offset: widget.user.userName.length));

    _firstNameController.text = widget.user.firstName;
    _firstNameController.selection = TextSelection.fromPosition(TextPosition(offset: widget.user.firstName.length));

    _lastNameController.text = widget.user.lastName;
    _lastNameController.selection = TextSelection.fromPosition(TextPosition(offset: widget.user.lastName.length));

    super.initState();
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
                  'Edit User',
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
                        if (_userNameController.text.isEmpty || _firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
                          EasyLoading.showError('Required text fields cannot be empty');

                          return;
                        }

                        try {
                          await DatabaseAPI().editUser(
                            firstName: _firstNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            userName: _userNameController.text.trim(),
                            userID: widget.user.userID,
                          );

                          ref.read(userListProvider.notifier).reset();

                          Navigator.pop(context);
                        } catch (e) {
                          return;
                        }
                      },
                      child: const Text('Edit'),
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
