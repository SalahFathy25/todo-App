import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/app/tasks/cubit/task_cubit.dart';

import '../../../core/utils/colors.dart';
import '../../data/hive_data_storage.dart';
import '../../tasks/task_view.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => TaskCubit(HiveDataStorage()),
              child: const TaskView(
                task: null,
              ),
            ),
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            CupertinoIcons.add,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
