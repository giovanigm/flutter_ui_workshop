import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/pokemon/details/pokemon_details_page.dart';
import 'package:flutter_ui_workshop/app/pokemon/widgets/pokemon_image.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../pokemon_list_cubit.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PokemonListCubit>();
    final state = cubit.state;

    return ListView.builder(
      itemCount: state.pokemonListLength + 1,
      itemBuilder: (context, index) {
        if (index >= state.pokemonListLength) {
          context.read<PokemonListCubit>().loadList();
          return state.isLoading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox();
        }

        final pokemonId = index + 1;

        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              final deviceType = getDeviceType(MediaQuery.of(context).size);
              if (deviceType == DeviceScreenType.mobile) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PokemonDetailsPage(pokemonId: pokemonId)));
              } else {
                cubit.selectPokemonId(pokemonId);
              }
            },
            child: Hero(
              tag: "pokemon-$pokemonId",
              child: PokemonImage(
                id: pokemonId,
                height: 150,
              ),
            ),
          ),
        );
      },
    );
  }
}
