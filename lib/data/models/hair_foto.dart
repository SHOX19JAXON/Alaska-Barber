class BarberWorkFotos {
  final String barberID;
  final String name;
  final List<String> image;
  final int likes; // Additional field for age
  final String description; // Additional field for experience in years

  BarberWorkFotos({
    required this.barberID,
    required this.name,
    required this.image,
    required this.likes,
    required this.description,
  });

  factory BarberWorkFotos.fromJson(Map<String, dynamic> json) {
    return BarberWorkFotos(
      barberID: json['barberID'] as String,
      name: json['name'] as String,
      image: json['image'] as List<String>? ?? [],
      likes: json['likes'] as int,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'barberID': barberID,
      'name': name,
      'image': image,
      'likes': likes,
      'description': description,
    };
  }

  static List<BarberWorkFotos> initialValue1() => [
        BarberWorkFotos(
            barberID: '', name: '', image: [], likes: 0, description: ""),
      ];
  static  BarberWorkFotos initialValue2() =>
      BarberWorkFotos(
          barberID: '', name: '', image: [], likes: 0, description: "");
}
