import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/livro.dart';
import '../pages/detalhes_livro.dart';

class LivroGradeItem extends StatelessWidget {
  const LivroGradeItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final livro = Provider.of<Livro>(context);
    return GridTile(
      child: GestureDetector(
        onDoubleTap: () {
          livro.changeFavorite();
        },
        onTap: () {
          Navigator.of(context).pushNamed(
            DetalhesLivro.routeName,
            arguments: {
              "id": livro.id,
            },
          );
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Image.network(
            livro.urlImagem,
            fit: BoxFit.fill,
          ),
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black38,
        leading: IconButton(
          icon: Icon(
            livro.favorito ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            livro.changeFavorite();
          },
        ),
        title: Center(
          child: Text(livro.titulo),
        ),
      ),
    );
  }
}