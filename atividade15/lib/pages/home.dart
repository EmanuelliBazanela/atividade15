import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repositories/livro_repository.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/grade_livros.dart';

class Home extends StatefulWidget {
  static final routeName = "/";

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _mostrarFavoritos = false;

  @override
  void initState() {
    super.initState();
    Provider.of<LivroRepository>(context, listen: false).carregarLivro();
  }

  mudarFiltroFavoritos() {
    setState(() {
      _mostrarFavoritos = !_mostrarFavoritos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text("Lista de Livros"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              mudarFiltroFavoritos();
            },
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      if (_mostrarFavoritos)
                        Icon(
                          Icons.check,
                          color: Colors.black,
                        ),
                      Text(
                        "Favoritos",
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: GradeLivro(mostrarFavoritos: _mostrarFavoritos),
      drawer: CustomDrawer(),
    );
  }
}