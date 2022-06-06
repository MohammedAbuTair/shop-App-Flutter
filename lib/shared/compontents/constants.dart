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
