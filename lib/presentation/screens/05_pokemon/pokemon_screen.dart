import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubits/presentation/blocs/blocs.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int pokemonId = 1;

  @override
  Widget build(BuildContext context) {
    final pokemonBloc = context.read<PokemonBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Pokémon ID: $pokemonId')),
      body: Center(
        child: FutureBuilder(
          future: pokemonBloc.fetchPokemonName(pokemonId),
          initialData: pokemonBloc.state.pokemons[pokemonId] ?? 'Loading...',
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            return Text(snapshot.data!);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-add',
            child: const Icon(Icons.plus_one),
            onPressed: () {
              pokemonId++;
              setState(() {});
            },
          ),

          const SizedBox(height: 15),

          FloatingActionButton(
            heroTag: 'btn-minus',
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              if (pokemonId <= 1) return;
              pokemonId--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
