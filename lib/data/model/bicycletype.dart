import 'package:praktikadatabase/domain/entity/bicycletype_entity.dart';

import '../../domain/entity/delivery_entity.dart';

class bicycletype extends bicycletypeEntity {
  bicycletype({
    super.id,
    required super.TypeOfBicycle,

  });

  Map<String, dynamic> toMap() {
    return {
      'TypeOfBicycle': TypeOfBicycle,
    };
  }

  factory bicycletype.toFromMap(Map<String, dynamic> json) {
    return bicycletype(
      id: json['id'] as int,
      TypeOfBicycle: json['TypeOfBicycle'],
    );
  }
}