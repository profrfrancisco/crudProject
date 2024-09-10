import '../models/user.dart';

/*
  Os mapas são coleções de dados organizados em um formato chave-valor.
  Cada elemento inserido em um mapa no Dart possui uma chave a ele relacionado.
  Os mapas são estruturas muito úteis quando precisamos relacionar cada elemento com um identificador único.
  Sendo assim, veremos neste artigo os principais métodos para manipulação de mapas no Dart.
*/

Map DUMMY_USERS = {
  '1': const User(
      id: '1',
      name: 'Maria',
      email: 'maria@alunos.com.br',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/04/01/12/11/avatar-1300582_1280.png'),
  '2': const User(
      id: '2',
      name: 'Rafael',
      email: 'rafael@alunos.com.br',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/03/31/20/11/avatar-1295573_1280.png'),
  '3': const User(
      id: '3',
      name: 'Fernanda',
      email: 'fernanda@alunos.com.br',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/03/31/20/11/avatar-1295575_1280.png'),
  '4': const User(
      id: '4',
      name: 'Guilherme',
      email: 'gui@alunos.com.br',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/03/31/20/27/avatar-1295773_960_720.png'),
};
