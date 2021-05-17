import 'package:flutter/material.dart';
import 'package:flutter_ui_workshop/app/pokemon/widgets/pokemon_image.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PokemonDetailsPage extends StatelessWidget {
  final int? pokemonId;

  const PokemonDetailsPage({
    Key? key,
    required this.pokemonId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);

    return Scaffold(
      appBar: deviceType == DeviceScreenType.mobile
          ? AppBar(title: Text("$pokemonId"))
          : null,
      body: Center(
          child: pokemonId == null
              ? const Center(
                  child: Text("Pokemon não selecionado"),
                )
              : Hero(
                  tag: "pokemon-$pokemonId",
                  child: PokemonImage(
                    id: pokemonId!,
                  ))),
    );
  }
}
