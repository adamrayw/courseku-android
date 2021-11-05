class CarouselArtikelModel {
  late int id;
  late String name;
  late String author;
  late String slug;

  CarouselArtikelModel({
    required this.id,
    required this.name,
    required this.author,
    required this.slug,
  });

  CarouselArtikelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'slug': slug,
    };
  }
}
