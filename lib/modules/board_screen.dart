import 'package:algoriza_task_app/modules/schedule_screen.dart';
import 'package:algoriza_task_app/modules/screens/active_tasks.dart';
import 'package:algoriza_task_app/modules/screens/all_tasks.dart';
import 'package:algoriza_task_app/modules/screens/completed_tasks.dart';
import 'package:algoriza_task_app/modules/screens/favourite_tasks.dart';
import 'package:algoriza_task_app/modules/task_screen.dart';
import 'package:algoriza_task_app/shared/componands/componands.dart';
import 'package:algoriza_task_app/shared/cubit/app_cubit.dart';
import 'package:algoriza_task_app/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        AppCubit cubit = BlocProvider.of<AppCubit>(context);
        return DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: false,
              title: const Text(
                'Board',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              elevation: 1,
              actions: [
                // IconButton(
                //   icon: const Icon(
                //     Icons.search,
                //     color: Colors.black,
                //   ),
                //   onPressed: () {},
                // ),
                // IconButton(
                //   icon: const Icon(
                //     Icons.notifications,
                //     color: Colors.black,
                //   ),
                //   onPressed: () {},
                // ),
                IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    navigateTo(context, const ScheduleScreen());
                  },
                ),
              ],
              bottom: TabBar(
                tabs: cubit.tabs,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black45,
                indicatorColor: Colors.black,
                indicatorWeight: 1.0,
                physics: const NeverScrollableScrollPhysics(),
                labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: cubit.tabController,
                      children: const [
                        AllTasksScreen(),
                        ActiveTasksScreen(),
                        CompletedTasksScreen(),
                        FavouriteTaskScreen(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  mainButton(
                    context: context,
                    onClick: () {
                      navigateTo(
                        context,
                        const TaskScreen(),
                      );
                    },
                    text: 'Add a task',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
