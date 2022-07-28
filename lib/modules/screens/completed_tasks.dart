import 'package:algoriza_task_app/shared/componands/componands.dart';
import 'package:algoriza_task_app/shared/cubit/app_cubit.dart';
import 'package:algoriza_task_app/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var completedTasks = AppCubit.get(context).completedTasks;
        return taskBuilder(tasks: completedTasks);
      },
    );
  }
}
