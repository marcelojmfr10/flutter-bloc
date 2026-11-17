import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubits/config/config.dart';
import 'package:flutter_bloc_cubits/presentation/blocs/blocs.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final usernameCubit = context.watch<UsernameCubit>();
    // print('CubitScreen build called');

    return Scaffold(
      appBar: AppBar(title: const Text('Cubit')),
      body: Center(
        child: BlocBuilder<UsernameCubit, String>(
          // buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Text(state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // usernameCubit.setUsername(RandomGenerator.getRandomName());
          context.read<UsernameCubit>().setUsername(
            RandomGenerator.getRandomName(),
          );
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
