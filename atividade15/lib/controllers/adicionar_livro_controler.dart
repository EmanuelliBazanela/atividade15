import 'package:flutter/foundation.dart';
import '../repositories/livro_repository.dart';
import '../utils/enums.dart';

class AdicionarLivroControler with ChangeNotifier { //declararando funçoes
  String _titulo = "";
  String _autor = "";
  String _edicao = "";
  String _date = "";
  String _descricao = "";
  String _urlImagem = "";

  final LivroRepository _repositorio;

  AdicionarLivroControler(this._repositorio);

  String get titulo => _titulo;
  String get autor => _autor;
  String get edicao => _edicao;
  String get date => _date;
  String get descricao => _descricao;
  String get urlImagem => _urlImagem;

  Status _status = Status.idle;

  bool get processando => _status == Status.working;

  bool get isValid {                   //validando funçoes
    return validarTitulo(_titulo) == null &&
        validarAutor(_autor) == null &&
        validarEdicao(_edicao) == null &&
        validarData(_date) == null &&
        validarDescricao(_descricao) == null &&
        validarUrl(_urlImagem) == null;
  }

  String? validarTitulo(String? val) {  //declarando a funçao 
    if (val == null || val.isEmpty) {
      return "O título não pode ser vazio";
    }
    if (val.length < 5) {
      return "O título deve conter mais que 5 letras";
    }
    return null;
  }

  String? validarAutor(String? val) {
    if (val == null || val.isEmpty) {
      return "O autor não pode ser vazio";
    }
    return null;
  }

  String? validarEdicao(String? val) {
    if (val == null || val.isEmpty) {
      return "A edição não pode ser vazia";
    }
    return null;
  }

  String? validarData(String? val) {
    if (val == null || val.isEmpty) {
      return "A data pode ser vazia";
    }
    if (val.length < 8) {
      return "A data deve conter o formato: dd/mm/aaaa";
    }
    return null;
  }

  String? validarDescricao(String? val) {}

  String? validarUrl(String? val) {}

  setTitulo(String val) {
    _titulo = val;
    print(_titulo);
    notifyListeners();
  }

  setAutor(String val) {
    _autor = val;
    notifyListeners();
  }

  setEdicao(String val) {
    _edicao = val;
    notifyListeners();
  }

  setData(String val) {
    _date = val;
    notifyListeners();
  }

  setDescricao(String val) {
    _descricao = val;
    notifyListeners();
  }

  setUrl(String val) {
    _urlImagem = val;
    notifyListeners();
  }

  ///Adiciona um produto no repositorio e processa
  ///o resultado.
  Future<String?> adicionar() async {
    _status = Status.working;
    notifyListeners();

    final resp = await _repositorio.adicionar(
      _titulo,
      _autor,
      _edicao,
      _date,
      _descricao,
      _urlImagem,
    );

    _status = Status.done;
    notifyListeners();

    return resp;
  }
}