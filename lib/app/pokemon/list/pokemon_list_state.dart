import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_state.freezed.dart';

@freezed
class PokemonListState with _$PokemonListState {
  factory PokemonListState({
    required int pokemonListLength,
    required bool isLoading,
    int? selectedPokemonId,
  }) = _PokemonListState;

  factory PokemonListState.initial() => PokemonListState(
        pokemonListLength: 20,
        isLoading: false,
      );
}
