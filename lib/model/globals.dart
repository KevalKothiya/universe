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

class ExplictMode_Model {
  bool isExplict;

  ExplictMode_Model({
    required this.isExplict,
  });
}

class Universe_Model {
  int id;
  String name;
  String type;
  String image;
  String details;
  String radius;
  String orbital_period;
  String gravity;
  String distance;

  Universe_Model({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.details,
    required this.radius,
    required this.orbital_period,
    required this.gravity,
    required this.distance,
  });

  factory Universe_Model.map({required Map data}) {
    return Universe_Model(
      id: data['id'],
      name: data['name'],
      type: data['type'],
      image: data['image'],
      details: data['details'],
      radius: data['radius'],
      distance: data['distance'],
      gravity: data['gravity'],
      orbital_period: data['orbital_period'],
    );
  }
}
