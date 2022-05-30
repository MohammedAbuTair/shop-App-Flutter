import 'package:flutter_bloc/flutter_bloc.dart';

class ShopAppCubit extends Cubit<int> {
  ShopAppCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
