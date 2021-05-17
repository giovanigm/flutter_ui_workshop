import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/pokemon/details/pokemon_details_page.dart';
import 'package:flutter_ui_workshop/app/pokemon/list/pokemon_list_cubit.dart';
import 'package:flutter_ui_workshop/app/pokemon/list/pokemon_list_state.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widget/pokemon_list.dart';

class PokemonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonListCubit>(
      create: (context) => PokemonListCubit(),
      child: BlocBuilder<PokemonListCubit, PokemonListState>(
        builder: (context, state) => ScreenTypeLayout.builder(
          mobile: (context) => const PokemonList(),
          tablet: (context) => Row(
            children: [
              const SizedBox(width: 600, child: PokemonList()),
              Expanded(
                  child: PokemonDetailsPage(pokemonId: state.selectedPokemonId))
            ],
          ),
        ),
      ),
    );
  }
}
