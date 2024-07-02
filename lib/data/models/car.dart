class Car {
  final String model;
  final String color;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;
  final String image;

  Car({
    required this.model,
    required this.color,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    required this.image,
  });

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
      image: data['image'],
      model: data['model'],
      color: data['color'],
      distance: data['distance'],
      fuelCapacity: data['fuelCapacity'],
      pricePerHour: data['pricePerHour'],
    );
  }
}
