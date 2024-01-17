import 'package:flutter_bloc/flutter_bloc.dart';

class MainInputCubit extends Cubit<String> {
  MainInputCubit() : super('');

  void setValue(String newValue) {
    emit(newValue);
  }
}
