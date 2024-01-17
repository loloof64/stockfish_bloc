import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stockfish_plugin/stockfish.dart';

class StockfishCubit extends Cubit<String> {
  late Stockfish _stockfish;
  late StreamSubscription<String> _stockfishStreamSubcription;

  StockfishCubit() : super("") {
    _stockfish = Stockfish();
    _stockfishStreamSubcription = _stockfish.stdout.listen((eventLine) {
      emit(eventLine);
    });
  }

  void sendCommand(String command) {
    _stockfish.stdin = command;
  }

  @override
  Future<void> close() async {
    _stockfishStreamSubcription.cancel();
    _stockfish.dispose();
    await Future.delayed(const Duration(milliseconds: 10));
    return super.close();
  }
}
