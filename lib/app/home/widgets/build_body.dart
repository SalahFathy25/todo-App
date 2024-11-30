import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/app/cubit/apptheme_cubit.dart';
import 'package:to_do_list_app/app/cubit/theme_state.dart';
import 'package:to_do_list_app/app/home/widgets/task_widget.dart';
import 'package:to_do_list_app/core/utils/constants.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/strings.dart';
import '../cubit/cubit/home_cubit.dart';
import 'no_tasks.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({super.key});

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(MyColors.primaryColor),
            ),
          );
        }
        if (state is HomeError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is HomeLoaded || state is HomeEmpty) {
          final tasks = state is HomeLoaded ? state.tasks : [];
          final completedTasks = tasks.where((task) => task.status).length;
          final double percent =
              tasks.isNotEmpty ? completedTasks / tasks.length : 0;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  //  const Spacer(),
                    Expanded(
                      child: BlocBuilder<AppthemeCubit, AppThemeState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              if (dark) {
                                BlocProvider.of<AppthemeCubit>(context)
                                    .changeTheme(ThemeState.light);
                              } else {
                                BlocProvider.of<AppthemeCubit>(context)
                                    .changeTheme(ThemeState.dark);
                              }
                              setState(
                                () {
                                  dark = !dark;
                                },
                              );
                            },
                            icon: Icon(
                              dark ? Icons.light_mode_outlined : Icons.dark_mode,
                              color: dark ? Colors.yellow : MyColors.primaryColor,
                            ),
                            iconSize: 40,
                          );
                        },
                      ),
                    ),
                    const Spacer(flex: 4),
                    Expanded(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () async {
                              if (tasks.isEmpty) {
                                warningNoTask(context);
                              } else {
                                await deleteAllTask(context);
                              }
                            },
                            icon: const Icon(CupertinoIcons.trash),
                            iconSize: 40,
                            color: MyColors.primaryColor,
                          );
                        },
                      ),
                    ),
                    // const Spacer()
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                width: double.infinity,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator(
                            valueColor: const AlwaysStoppedAnimation(
                              MyColors.primaryColor,
                            ),
                            color: Colors.grey.shade300,
                            strokeWidth: 3,
                            strokeCap: StrokeCap.round,
                            backgroundColor: Colors.grey.shade300,
                            value: percent,
                          ),
                        ),
                        Text(
                          '${(percent * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            color: MyColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyString.mainTitle,
                          style: texttheme.displayLarge,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '$completedTasks of ${tasks.length} tasks',
                          style: texttheme.titleMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Divider(
                  thickness: 2,
                  indent: 100,
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: tasks.isEmpty
                    ? noTasks(texttheme)
                    : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.horizontal,
                            onDismissed: (direction) {
                              context
                                  .read<HomeCubit>()
                                  .deleteTask(tasks[index]);
                              taskDeleted(context);
                            },
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Delete',
                                        style: texttheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Delete',
                                        style: texttheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            child: TaskWidget(task: tasks[index]),
                          );
                        },
                      ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
