import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/counter/counter_page.dart';
import 'package:flutter_ui_workshop/app/drawer/drawer.dart';
import 'package:flutter_ui_workshop/app/form/form_page.dart';
import 'package:flutter_ui_workshop/app/pokemon/list/pokemon_list_page.dart';

import 'main_cubit.dart';

class MainPage extends StatelessWidget {
  final _pages = <Widget, String>{
    CounterPage(): "Counter",
    PokemonListPage(): "Pokemon",
    FormPage(): "Form",
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text(_pages.values.elementAt(state)),
            ),
            drawer: AppDrawer(),
            body: _pages.keys.elementAt(state)),
      ),
    );
  }
}
