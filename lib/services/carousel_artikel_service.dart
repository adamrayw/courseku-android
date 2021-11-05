// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:courseku_mobile/models/carousel_artikel_model.dart';
import 'package:http/http.dart' as http;

class CarouselArtikelService {
  String baseUrl = 'http://courseku.herokuapp.com/api';

  Future<List<CarouselArtikelModel>> getArtikel() async {
    var url = '$baseUrl/carousel-artikel';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<CarouselArtikelModel> artikels = [];

      for (var item in data) {
        artikels.add(CarouselArtikelModel.fromJson(item));
      }

      return artikels;
    } else {
      throw Exception('Gagal fetch artikel');
    }
  }
}
