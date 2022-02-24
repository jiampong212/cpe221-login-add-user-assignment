import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_add_screen_assignment/add_user.dart';
import 'package:login_add_screen_assignment/database_api.dart';
import 'package:login_add_screen_assignment/edit_user.dart';
import 'package:login_add_screen_assignment/login_screen.dart';
import 'package:login_add_screen_assignment/user_data_class.dart';
import 'package:login_add_screen_assignment/user_list_provider.dart';

final userListProvider = StateNotifierProvider<UserListProvider, List<User>>((ref) {
  return UserListProvider();
});

final userDataProvider = StateProvider<User>((ref) {
  return User.empty();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          _logout(context),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 300,
          height: MediaQuery.of(context).size.height - 300,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _dataTable(ref),
                  _buttons(context, ref),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> columns() {
    return const <DataColumn>[
      DataColumn(
        label: Text(
          'User ID',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
      DataColumn(
        label: Text(
          'Username',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
      DataColumn(
        label: Text(
          'First Name',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
      DataColumn(
        label: Text(
          'Last Name',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
      DataColumn(
        label: Text(
          'Password',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
    ];
  }

  List<DataRow> rows(WidgetRef ref) {
    List<DataRow> _list = [];

    String selectedID = ref.watch(userDataProvider).userID;

    ref.watch(userListProvider).forEach((element) {
      _list.add(
        DataRow(
          selected: selectedID == element.userID,
          onSelectChanged: (selected) {
            ref.watch(userDataProvider.state).state = element;
          },
          cells: [
            DataCell(Text(element.userID)),
            DataCell(Text(element.userName)),
            DataCell(Text(element.firstName)),
            DataCell(Text(element.lastName)),
            DataCell(Text(element.password)),
          ],
        ),
      );
    });

    return _list;
  }

  Padding _buttons(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50.0, 30.0, 0, 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: const Size(150, 80)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AddUser();
                },
              );
            },
            child: const Text('Add'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: const Size(150, 80)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return EditUser(
                    user: ref.read(userDataProvider),
                  );
                },
              );
            },
            child: const Text('Edit'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: const Size(150, 80)),
            onPressed: () async {
              String _selectedID = ref.read(userDataProvider).userID;

              await DatabaseAPI().deleteUser(_selectedID);

              await ref.read(userListProvider.notifier).reset();
            },
            child: const Text('Delete'),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(150, 80)),
              onPressed: () {
                ref.read(userListProvider.notifier).reset();
              },
              child: const Text('Refresh')),
        ],
      ),
    );
  }

  Widget _dataTable(WidgetRef ref) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: DataTable(
          showCheckboxColumn: false,
          showBottomBorder: true,
          columns: columns(),
          rows: rows(ref),
        ),
      ),
    );
  }

  TextButton _logout(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ),
        );
      },
      icon: const Icon(Icons.logout),
      label: const Text('Log Out'),
    );
  }}
