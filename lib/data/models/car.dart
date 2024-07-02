class Car {
  final String model;
  final String color;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car(
      {required this.model,
      required this.color,
      required this.distance,
      required this.fuelCapacity,
      required this.pricePerHour});

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
      model: data['model'],
      color: data['color'],
      distance: data['distance'],
      fuelCapacity: data['fuelCapacity'],
      pricePerHour: data['pricePerHour'],
    );
  }
}
