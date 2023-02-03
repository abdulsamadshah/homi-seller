
class SubSubCategory {

  var id;
  var name;
  // String xyz;
  SubSubCategory({this.id, this.name});

  factory SubSubCategory.fromJson(Map<String, dynamic> json) {
    return SubSubCategory(
        id: json['id'] ?? 0,
        name: json['name'],
    );
  }

}
