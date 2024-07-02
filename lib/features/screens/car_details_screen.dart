import 'package:car_rent_app/data/models/car.dart';
import 'package:car_rent_app/features/screens/maps_details_screen.dart';
import 'package:car_rent_app/features/widgets/car_card.dart';
import 'package:car_rent_app/features/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!);

    _animation!.addListener(() {
      setState(() {});
    });

    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

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
              image: widget.car.image,
              model: widget.car.model,
              color: widget.car.color,
              distance: widget.car.distance,
              fuelCapacity: widget.car.fuelCapacity,
              pricePerHour: widget.car.pricePerHour,
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
                              image: widget.car.image,
                              model: widget.car.model,
                              color: widget.car.color,
                              distance: widget.car.distance,
                              fuelCapacity: widget.car.fuelCapacity,
                              pricePerHour: widget.car.pricePerHour,
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
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/maps.png',
                            fit: BoxFit.cover,
                          ),
                        ),
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
                    image: widget.car.image,
                    model: "${widget.car.model} -1",
                    color: widget.car.color,
                    distance: widget.car.distance + 400,
                    fuelCapacity: widget.car.fuelCapacity + 19,
                    pricePerHour: widget.car.pricePerHour,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                    image: widget.car.image,
                    model: "${widget.car.model} -2",
                    color: widget.car.color,
                    distance: widget.car.distance + 200,
                    fuelCapacity: widget.car.fuelCapacity + 27,
                    pricePerHour: widget.car.pricePerHour,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                    image: widget.car.image,
                    model: "${widget.car.model} -3",
                    color: widget.car.color,
                    distance: widget.car.distance + 300,
                    fuelCapacity: widget.car.fuelCapacity + 10,
                    pricePerHour: widget.car.pricePerHour,
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
