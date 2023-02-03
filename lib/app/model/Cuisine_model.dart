
class Cuisine {

  var id;
  var name;
  // String xyz;
  Cuisine({this.id, this.name});

  factory Cuisine.fromJson(Map<String, dynamic> json) {
    return Cuisine(
        id: json['id'] ?? 0,
        name: json['name'],
    );
  }

}
