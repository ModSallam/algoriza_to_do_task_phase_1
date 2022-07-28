import 'package:algoriza_task_app/bloc_observer.dart';
import 'package:algoriza_task_app/modules/board_screen.dart';
import 'package:algoriza_task_app/shared/cubit/app_cubit.dart';
import 'package:algoriza_task_app/shared/cubit/app_states.dart';
import 'package:algoriza_task_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (BuildContext context, AppStates state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'To-Do',
            themeMode: ThemeMode.light,
            theme: lightTheme,
            home: const BoardScreen(),
          );
        },
      ),
    );
  }
}