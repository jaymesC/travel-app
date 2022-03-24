import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/navpages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

import 'app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is DetailState) {
            return DetailPage();
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is LoadingState) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
