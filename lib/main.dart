import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubits/config/config.dart';
import 'package:flutter_bloc_cubits/presentation/blocs/blocs.dart';

void main() {
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsernameCubit(), lazy: false),
        BlocProvider(create: (context) => RouterSimpleCubit()),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: theme.isDarkmode).getTheme(),
    );
  }
}
