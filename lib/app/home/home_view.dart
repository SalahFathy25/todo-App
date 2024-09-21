import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/app/data/hive_data_storage.dart';
import 'package:to_do_list_app/app/home/cubit/cubit/home_cubit.dart';

import 'widgets/FAB.dart';
import 'widgets/build_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HiveDataStorage())..loadTasks(),
      child:const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: Fab(),
          body: BuildBody(),
        ),
      ),
    );
  }
}
