import 'package:flutter/material.dart';

class Livro with ChangeNotifier {
  final String id;
  final String titulo;
  final String autor;
  final String edicao;
  final String date;
  final String descricao;
  final String urlImagem;
  bool favorito;

  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.edicao,
    required this.date,
    required this.descricao,
    required this.urlImagem,
    this.favorito = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'edicao': edicao,
      'date': date,
      'descricao': descricao,
      'urlImagem': urlImagem,
      'favorito': favorito
    };
  }

  void changeFavorite() {
    favorito = !favorito;
    notifyListeners();
  }

  factory Livro.fromJson(Map<String, dynamic> data) => Livro(
        id: data['id'],
        titulo: data['titulo'],
        autor: data['autor'],
        edicao: data['edicao'],
        date: data['date'],
        descricao: data['descricao'],
        urlImagem: data['urlImagem'],
        favorito: data['favorito'],
      );

  Livro copyWith(
      {String? id,
      String? titulo,
      String? autor,
      String? edicao,
      String? date,
      String? descricao,
      String? urlImagem,
      bool? favorito}) {
    return Livro(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        autor: autor ?? this.autor,
        edicao: edicao ?? this.edicao,
        date: date ?? this.date,
        descricao: descricao ?? this.descricao,
        urlImagem: urlImagem ?? this.urlImagem,
        favorito: favorito ?? this.favorito);
  }
}