import 'package:chess_uci_bloc/cubits/main_input.dart';
import 'package:chess_uci_bloc/cubits/stockfish_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stockfish + BLoC demo'),
      ),
      body: BlocBuilder<StockfishCubit, String>(
          builder: (context, stockfishOutputs) {
        return BlocBuilder<MainInputCubit, String>(
            builder: (context, mainInputValue) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('command'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(onChanged: (value) {
                        context.read<MainInputCubit>().setValue(value);
                      }),
                    ),
                  ),
                ],
              )
            ],
          );
        });
      }),
    );
  }
}
