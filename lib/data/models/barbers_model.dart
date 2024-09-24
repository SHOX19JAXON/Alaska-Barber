import 'package:alaska_barber/data/models/barber_work_photos.dart';

class BarbersModel {
  final int id;
  final String name;
  final String surname;
  final String image;
  final int age;
  final double workExperience;
  final double skills;
  final String phoneNumber;
  final String email;
  final String description;
  final List<BarberWorkFotos> fotos;
  BarbersModel( {
    required this.id,
    required this.name,
    required this.surname,
    required this.image,
    required this.age,
    required this.workExperience,
    required this.skills,
    required this.phoneNumber,
    required this.email,
    required this.description,
    required this.fotos,
  });

  factory BarbersModel.fromJson(Map<String, dynamic> json) {
    return BarbersModel(
      id: json['id'] as int? ?? 0,
      name: json['name']as String? ?? '',
      surname: json['surname']as String? ?? '',
      image: json['image']as String? ?? '',
      age: json['age']as int? ?? 0,
      workExperience: json['workExperience']as double? ?? 0,
      skills: json['skills']as double? ?? 0,
      phoneNumber: json['phoneNumber']as String? ?? '',
      email: json['email']as String? ?? '',
      description: json['description']as String? ?? '',
      fotos: BarberWorkFotos.initialValue1()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'image': image,
      'age': age,
      'workExperience': workExperience,
      'skills': skills,
      'phoneNumber': phoneNumber,
      'email': email,
      'description': description,
      'fotos': fotos,
    };
  }
}
