import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/livro_repository.dart';
import 'livro_grade_item.dart';

class GradeLivro extends StatelessWidget {
  final bool mostrarFavoritos;

  GradeLivro({
    Key? key,
    this.mostrarFavoritos = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repositorio = Provider.of<LivroRepository>(context);

    var lista = repositorio.livro;
    if (mostrarFavoritos) {
      lista = repositorio.favoritos;
    }

    return !repositorio.hasData
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: lista.length,
            itemBuilder: (context, index) {
              final livro = lista[index];
              return ChangeNotifierProvider.value(
                value: livro,
                child: LivroGradeItem(),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 3 / 2,
            ),
          );
  }
}