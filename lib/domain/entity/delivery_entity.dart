class DeliveryEntity {
  late int id;
  final DateTime DateofDelivery;
  final int number_of_house;
  final String Name_of_Client;
  final String name_street;
  final int floor;


  DeliveryEntity({
    this.id = 0,
    required this.number_of_house,
    required this.name_street,
    required this.floor,
    required this.DateofDelivery,
    required this.Name_of_Client,

  });
}
