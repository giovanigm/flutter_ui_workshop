import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/main/main_page.dart';
import 'package:flutter_ui_workshop/app/theme/theme_cubit.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) => MaterialApp(
          home: MainPage(),
          title: 'Flutter Workshop',
          debugShowCheckedModeBanner: false,
          theme: state,
        ),
      ),
    );
  }
}
