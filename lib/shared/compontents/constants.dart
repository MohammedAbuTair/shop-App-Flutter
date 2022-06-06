import 'package:shop_app/modules/shop_app/login/login_screen.dart';
import 'package:shop_app/shared/compontents/compontents.dart';
import 'package:shop_app/shared/network/local/cacheHelpers.dart';

void logout(context) {
  CacheHelpers.removeData(key: 'token').then((value) {
    if (value) {
      navagetAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}

void printAllData(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
