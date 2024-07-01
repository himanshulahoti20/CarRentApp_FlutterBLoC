import 'package:car_rent_app/data/models/car.dart';
import 'package:car_rent_app/features/screens/maps_details_screen.dart';
import 'package:car_rent_app/features/widgets/car_card.dart';
import 'package:car_rent_app/features/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(
              width: 2,
            ),
            Text(
              'Information',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
              model: car.model,
              color: car.color,
              distance: car.distance,
              fuelCapacity: car.fuelCapacity,
              pricePerHour: car.pricePerHour,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5)
                      ],
                    ),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Jane Cooper',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,253',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapsDetailsScreen(
                            car: Car(
                              model: car.model,
                              color: car.color,
                              distance: car.distance,
                              fuelCapacity: car.fuelCapacity,
                              pricePerHour: car.pricePerHour,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/maps.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                    model: "${car.model} -1",
                    color: car.color,
                    distance: car.distance + 400,
                    fuelCapacity: car.fuelCapacity + 19,
                    pricePerHour: car.pricePerHour,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                    model: "${car.model} -2",
                    color: car.color,
                    distance: car.distance + 200,
                    fuelCapacity: car.fuelCapacity + 27,
                    pricePerHour: car.pricePerHour,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                    model: "${car.model} -3",
                    color: car.color,
                    distance: car.distance + 300,
                    fuelCapacity: car.fuelCapacity + 10,
                    pricePerHour: car.pricePerHour,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
