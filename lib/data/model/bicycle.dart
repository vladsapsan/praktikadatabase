import 'package:praktikadatabase/domain/entity/bicycle_entity.dart';

import '../../domain/entity/delivery_entity.dart';

class bicycle extends bicycleEntity {
  bicycle({
    super.id,
    required super.NameofBicycle,
    required super.MadeIn,
    required super.PriceofBicycle,
    required super.Type,
  });

  Map<String, dynamic> toMap() {
    return {
      'NameofBicycle': NameofBicycle,
      'MadeIn': MadeIn,
      'PriceofBicycle': PriceofBicycle,
      'Type': Type,
    };
  }

  factory bicycle.toFromMap(Map<String, dynamic> json) {
    return bicycle(
      id: json['id'] as int,
      NameofBicycle: json['NameofBicycle'],
      MadeIn: json['MadeIn'],
      PriceofBicycle: json['PriceofBicycle'],
      Type: json['Type'],
    );
  }
}