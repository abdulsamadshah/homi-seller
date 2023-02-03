
class Category {

  var id;
  var name;
  // String xyz;
  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'] ?? 0,
        name: json['name'],
    );
  }

}
