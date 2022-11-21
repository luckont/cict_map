const List<String> list = <String>[
  'Sảnh khoa','Phong 108', 
  //'Phong 102', 'Phong 103', 'Phong 104', 'Phong 105', 
  // 'Phong 106', 'Phong 107', 'Phong 108', 'Phong 109', 'Phong 110', 
  // 'Phong 111', 'Phong 112', 'Phong 113',
  // 'Phong 201', 'Phong 202', 'Phong 203', 'Phong 204', 'Phong 205', 
  // 'Phong 206', 'Phong 207', 'Phong 208', 'Phong 209', 'Phong 210', 
  // 'Phong 211', 'Phong 212', 'Phong 213', 'Phong 214', 'Phong 215', 
  // 'Phong 216', 'Phong 217', 'Phong 218', 'Phong 219', 'Phong 220', 
  // 'Phong 221'
  ];
  
class Location {
  final String? id;
  final String name;
  final double x;
  final double y;

  Location({
    this.id,
    required this.name,
    required this.x,
    required this.y,
  });

  Location copyWith({
    String? id,
    String? name,
    double? x,
    double? y,
  }){

    return Location(
      name: name ?? this.name, 
      x: x ?? this.x, 
      y: y ?? this.y
    );
  }
}

class LocationManager {
  final List<Location> _locations = [
    Location(
      name: 'Phong 101', 
      x: 300, 
      y: 200
      ),
    
  ];

  int get locaCount {
    return _locations.length;
  }

  List<Location> get locations{
    return [..._locations];
  }
}