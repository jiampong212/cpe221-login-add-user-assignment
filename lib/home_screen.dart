import 'package:flutter/material.dart';
import 'package:login_add_screen_assignment/add_user.dart';
import 'package:login_add_screen_assignment/edit_user.dart';
import 'package:login_add_screen_assignment/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
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
                  _dataTable(),
                  _buttons(context),
                ],
              ),
            ),
          ),
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
  }

  Expanded _dataTable() {
    return Expanded(
      child: DataTable(
        showBottomBorder: true,
        columns: <DataColumn>[
          const DataColumn(
            label: Text(
              'User ID',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
          ),
          const DataColumn(
            label: Text(
              'Username',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
          ),
          DataColumn(
            onSort: (columnIndex, ascending) {},
            label: const Text(
              'First Name',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
          ),
          const DataColumn(
            label: Text(
              'Last Name',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
          ),
          const DataColumn(
            label: Text(
              'Password',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
          ),
        ],
        rows: const [
          DataRow(
            cells: <DataCell>[
              DataCell(Text('6Xo5Zg484Pz5Hle')),
              DataCell(Text('Gelo')),
              DataCell(Text('John Angelo')),
              DataCell(Text('Cordero')),
              DataCell(Text('password123')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('oLrh7z1e7juF8nl')),
              DataCell(Text('JohnGee')),
              DataCell(Text('John Gee')),
              DataCell(Text('Mondragon')),
              DataCell(Text('example12356789')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('iifZfm1kZWfNWXK')),
              DataCell(Text('Jekoy')),
              DataCell(Text('Jericho')),
              DataCell(Text('Pastrana')),
              DataCell(Text('test54321')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('j28KC4SSRPccHGV')),
              DataCell(Text('Kelah')),
              DataCell(Text('James Heschel')),
              DataCell(Text('Medina')),
              DataCell(Text('gwapoako12')),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buttons(BuildContext context) {
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
                  return const EditUser();
                },
              );
            },
            child: const Text('Edit'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: const Size(150, 80)),
            onPressed: () {},
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
