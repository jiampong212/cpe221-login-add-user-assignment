import 'package:flutter/material.dart';

class EditUser extends StatelessWidget {
  const EditUser({Key? key}) : super(key: key);

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
                  height: 40,
                ),
                const Text('Username'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: 'Kelah',
                  decoration: const InputDecoration(
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
                TextFormField(
                  initialValue: 'James Heschel',
                  decoration: const InputDecoration(
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
                TextFormField(
                  initialValue: 'Medina',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('New Password'),
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
                  height: 20,
                ),
                const Text('Confirm New Password'),
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
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Edit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
