import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/login/cubit/states.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dioHelper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginLoadingStates());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingStates());
    print("login start ============");
    print(email);
    print("login url : " + LOGIN);
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print("respond Data : ");
      print(value);
      emit(ShopLoginSuccessStates());
    }).catchError((error) {
      print(error);
      emit(ShopLoginErrorStates(error.toString()));
    });
  }
}
