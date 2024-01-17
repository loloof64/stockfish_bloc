import 'package:chess_uci_bloc/cubits/main_input.dart';
import 'package:chess_uci_bloc/cubits/stockfish_cubit.dart';
import 'package:chess_uci_bloc/ui/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stockfish + BLoC demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<StockfishCubit>(
            create: (BuildContext context) => StockfishCubit(),
          ),
          BlocProvider<MainInputCubit>(
            create: (BuildContext context) => MainInputCubit(),
          ),
        ],
        child: const MainScaffold(),
      ),
    );
  }
}
