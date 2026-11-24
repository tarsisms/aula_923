import 'package:aula_923/domain/propriedade.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Propriedade> _favoritos = [];

  List<Propriedade> get favoritos => _favoritos;

  addFavorite(Propriedade propriedade) {
    // Se a propriedade não estiver na lista
    // Posso adicionar a propriedade
    if (!isFavorite(propriedade)) {
      _favoritos.add(propriedade);
    } else {
      removeFavorite(propriedade);
    }

    notifyListeners();
  }

  removeFavorite(Propriedade propriedade) {
    for (int i = 0; i < _favoritos.length; i++) {
      if (_favoritos[i].id == propriedade.id) {
        _favoritos.removeAt(i);
        break;
      }
    }
  }

  bool isFavorite(Propriedade propriedade) {
    // Procurando a propriedade na lista
    for (var prop in _favoritos) {
      if (prop.id == propriedade.id) {
        return true;
      }
    }

    return false;
  }
}
