import 'package:flutter/cupertino.dart';

/*
  Uma variável ou atributo final pode ser inicializada em algum momento após a sua declaração,
  porém uma vez atribuído um valor, este não poderá mais ser alterado
*/

class User{
  final String? id;
  final String? name;
  final String? email;
  final String? avatarUrl;

  /*
    Construtores são basicamente funções de inicialização de uma classe,
    as quais são invocadas no momento em que objetos desta classe são criadas.
    Eles permitem inicializar campos internos da classe e alocar recursos que um objeto da classe possa demandar, tais como memória, arquivos, semáforos, soquetes, etc.
  */
  //Construtor do tipo constante pois todas variávies são do tipo final
  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
  });
}