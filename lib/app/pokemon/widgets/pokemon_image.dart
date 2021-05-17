import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  final int id;
  final double? height;

  const PokemonImage({
    Key? key,
    required this.id,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      imageUrl: "https://pokeres.bastionbot.org/images/pokemon/$id.png",
    );
  }
}
