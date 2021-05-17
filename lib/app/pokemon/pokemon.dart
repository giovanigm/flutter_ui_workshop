import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
  }) = _Pokemon;

  const Pokemon._();

  String get imageUrl =>
      "https://pokeres.bastionbot.org/images/pokemon/$id.png";
}
