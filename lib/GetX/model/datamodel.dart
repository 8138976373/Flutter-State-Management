
class Model {
  final String title;
  final String name;
  final int id ;

  Model({required this.id
    ,required this.name
    ,required this.title});

  factory Model.fromJson(Map<String, dynamic> json) {
    return new Model(
      id : json['id'],
      name: json['title'],
      title: json['docid'],
    );
  }

}