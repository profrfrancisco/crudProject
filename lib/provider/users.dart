import 'dart:convert';
import 'dart:math';

import 'package:crud/data/dummy_users.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  static const _baseUrl =
      'https://crud-firebase-6e40a-default-rtdb.firebaseio.com';

  final Map<String, User> _items = {...DUMMY_USERS};

  Set<User> get all {
    return {..._items.values};
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Future<void> put(User user) async {
    // if (user.id == null) {
    //   return;
    // }

    //ATUALIAR
    if (user.id != null &&
        user.id!.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      await http.patch(Uri.parse("$_baseUrl/users/${user.id}.json"),
          body: json.encode({
            'name': user.name,
            'email': user.email,
            'avatarUrl': user.avatarUrl,
          }));
      _items.update(
          user.id!,
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      //CRIAR
      final response = await http.post(Uri.parse("$_baseUrl/users.json"),
          body: json.encode({
            'name': user.name,
            'email': user.email,
            'avatarUrl': user.avatarUrl,
          }));

      final id = json.decode(response.body)['name'];
      //print(json.decode(response.body));
      //final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    notifyListeners();
  }

  //DELETAR
  Future<void> remove(User user) async {
    if (user.id != null) {
      await http.delete(Uri.parse("$_baseUrl/users/${user.id}.json"),
          body: json.encode({
            'name': user.name,
            'email': user.email,
            'avatarUrl': user.avatarUrl,
          }));

      _items.remove(user.id);
      notifyListeners();
    }
  }
}
