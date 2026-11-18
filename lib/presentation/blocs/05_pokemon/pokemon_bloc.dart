import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_cubits/config/config.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState()) {
    on<PokemonAdded>((event, emit) {
      final newPokemons = Map<int, String>.from(state.pokemons);

      newPokemons[event.id] = event.name;
      emit(state.copyWith(pokemons: newPokemons));
    });
  }

  Future<String> fetchPokemonName(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }

    try {
      final pokemonName = await PokemonInformation.getPokemonName(id);
      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Failed to fetch pokemon name');
    }
  }
}
