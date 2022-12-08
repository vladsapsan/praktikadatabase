import '../../domain/entity/delivery_entity.dart';

class Delivery extends DeliveryEntity {
  Delivery({
    super.id,
    required super.number_of_house,
    required super.name_street,
    required super.floor,
    required super.DateofDelivery,
    required super.Name_of_Client,
  });

  Map<String, dynamic> toMap() {
    return {
      'number_of_house': number_of_house,
      'name_street': name_street,
      'floor': floor,
      'DateofDelivery': DateofDelivery,
      'Name_of_Client': Name_of_Client,
    };
  }

  factory Delivery.toFromMap(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'] as int,
      number_of_house: json['number_of_house'],
      name_street: json['name_street'],
      floor: json['floor'],
      DateofDelivery: json['DateofDelivery'],
      Name_of_Client: json['Name_of_Client'],
    );
  }
}
