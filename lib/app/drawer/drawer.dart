import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/main/main_cubit.dart';
import 'package:flutter_ui_workshop/app/theme/app_theme.dart';
import 'package:flutter_ui_workshop/app/theme/theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainCubit = context.watch<MainCubit>();
    final selectedPageIndex = mainCubit.state;

    final themeCubit = context.watch<ThemeCubit>();
    final theme = themeCubit.state;

    return Drawer(
      child: ListView(
        children: [
          ListTile(
            selected: selectedPageIndex == 0,
            title: const Text("Counter"),
            onTap: () => _selectPage(context, index: 0),
          ),
          ListTile(
            selected: selectedPageIndex == 1,
            title: const Text("Pokemon"),
            onTap: () => _selectPage(context, index: 1),
          ),
          ListTile(
            selected: selectedPageIndex == 2,
            title: const Text("Form"),
            onTap: () => _selectPage(context, index: 2),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text("Tema Escuro"),
            value: theme == appThemeData[AppTheme.dark],
            onChanged: (isDarkTheme) {
              themeCubit
                  .changeTheme(isDarkTheme ? AppTheme.dark : AppTheme.light);
            },
          )
        ],
      ),
    );
  }

  void _selectPage(BuildContext context, {required int index}) {
    final cubit = context.read<MainCubit>();
    cubit.selectPage(index);
    Navigator.of(context).pop();
  }
}
