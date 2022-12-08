class CarsEntity {
  late int id;
  final String ClassofCar;
  final String Price;
  final String MadeIn;
  final String Country;

  CarsEntity({
    this.id = 0,
    required this.ClassofCar,
    required this.Price,
    required this.MadeIn,
    required this.Country,
  });
}
