import 'package:flutter_bloc/flutter_bloc.dart';

import 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit() : super(PokemonListState.initial());

  Future<void> loadList() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      pokemonListLength: state.pokemonListLength + 20,
      isLoading: false,
    ));
  }

  void selectPokemonId(int id) => emit(state.copyWith(selectedPokemonId: id));
}
