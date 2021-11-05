class CarouselArtikelModel {
  late int id;
  late String name;
  late String slug;

  CarouselArtikelModel(
      {required this.id, required this.name, required this.slug});

  CarouselArtikelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }
}
