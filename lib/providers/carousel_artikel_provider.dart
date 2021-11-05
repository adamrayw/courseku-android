// ignore_for_file: avoid_print

import 'package:courseku_mobile/models/carousel_artikel_model.dart';
import 'package:courseku_mobile/services/carousel_artikel_service.dart';
import 'package:flutter/material.dart';

class CarouselArtikelProvider with ChangeNotifier {
  List<CarouselArtikelModel> _artikels = [];
  List<CarouselArtikelModel> get artikel => _artikels;

  set artikel(List<CarouselArtikelModel> artikels) {
    _artikels = artikels;
    notifyListeners();
  }

  Future<void> getArtikel() async {
    try {
      List<CarouselArtikelModel> artikels =
          await CarouselArtikelService().getArtikel();
      _artikels = artikels;
    } catch (e) {
      print(e);
    }
  }
}
