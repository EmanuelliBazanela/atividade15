import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home.dart';
import '../pages/lista_livros.dart';
import '../services/autenticacao_servico.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _servicoAutenticacao =
        Provider.of<ServicoAutenticacao>(context, listen: false);

    return Drawer(  // barra de menu onde consegue acessar as paginas
      child: Column(
        children: [
          AppBar(
            title: Text("Livros e Cia"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          Text("Olá ${_servicoAutenticacao.usuario!.email}"),
          Divider(),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(Home.routeName),
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ListaLivro.routeName),
            leading: Icon(Icons.ad_units),
            title: Text('Registro de livros'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              _servicoAutenticacao.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}