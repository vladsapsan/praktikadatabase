
import '../../domain/entity/Cars_Entity.dart';

class Cars extends CarsEntity {
  Cars({
     super.id,
    required super.ClassofCar,
    required super.Price,
    required super.MadeIn,
    required super.Country,
  });

  Map<String, dynamic> toMap() {
    return {
      'ClassofCar': ClassofCar,
      'Price': Price,
      'MadeIn': MadeIn,
      'Country': Country,
    };
  }

  factory Cars.toFromMap(Map<String, dynamic> json) {
    return Cars(
      id: json['id'] as int,
      ClassofCar: json['surname'],
      Price: json['name'],
      MadeIn: json['middleName'],
      Country: json['email'],
    );
  }
}
