class DarkMode_Model {
  bool isDark;

  DarkMode_Model({
    required this.isDark,
  });
}

class GridViewMode_Model {
  bool isGrid;

  GridViewMode_Model({
    required this.isGrid,
  });
}

class Universe_Model {
  int id;
  String name;
  String type;
  String image;
  String details;

  Universe_Model({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.details,
  });

  factory Universe_Model.map({required Map data}) {
    return Universe_Model(
      id: data['id'],
      name: data['name'],
      type: data['type'],
      image: data['image'],
      details: data['details'],
    );
  }
}
