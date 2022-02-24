import 'package:login_add_screen_assignment/database_api.dart';
import 'package:login_add_screen_assignment/user_data_class.dart';
import 'package:riverpod/riverpod.dart';

class UserListProvider extends StateNotifier<List<User>> {
  UserListProvider() : super([]);

  Future init() async {
    await DatabaseAPI().queryTable().then((value) {
      List<User> _list = [];

      for (var row in value) {
        _list.add(User(
          firstName: row[0],
          lastName: row[1],
          userName: row[2],
          userID: row[3],
          password: row[4],
        ));
      }

      state = _list;
    });
  }

  Future reset() async {
    await init();
  }
}
