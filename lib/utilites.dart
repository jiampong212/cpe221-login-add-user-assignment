import 'package:nanoid/nanoid.dart';

class Utils {

 final String _customAlphabet = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

String generateUserID() {
    return customAlphabet(_customAlphabet, 15);
  }


}