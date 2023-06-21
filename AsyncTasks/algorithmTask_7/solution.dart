import 'dart:async';
import 'package:dio/dio.dart';

Future<void> getPokemonsList(offset, limit) async {
  final dio = Dio();
  final response = await dio
      .get('https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit');

  if (response.statusCode == 200) {
    final pokemonList = response.data['results'];
    final List<String> nameList = <String>[];

    for (final pokemon in pokemonList) {
      final String name = pokemon['name'];
      nameList.add(name);
    }

    print(nameList);
  } else {
    print('похоже, что покемоны кончились');
  }
  return;
}

void main() async {
  getPokemonsList(1, 5);//[ivysaur, venusaur, charmander, charmeleon, charizard]
  getPokemonsList(1, 7); //[ivysaur, venusaur, charmander, charmeleon, charizard, squirtle, wartortle]
  getPokemonsList(2, 10);//[venusaur, charmander, charmeleon, charizard, squirtle, wartortle, blastoise, caterpie, metapod, butterfree]
}
