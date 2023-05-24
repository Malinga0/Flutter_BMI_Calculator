import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/const.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int height = 150;
  int weight = 70;

  String gender = '';
  late double bmi = calculateBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Male");
                      setState(() {
                        gender = "M";
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                          color: gender == "M"
                              ? Colors.orange.withAlpha(150)
                              : Colors.orange.withAlpha(70),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male, size: 150),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("Female");
                      setState(() {
                        gender = "F";
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                          color: gender == "F"
                              ? Colors.orange.withAlpha(150)
                              : Colors.orange.withAlpha(70),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.female, size: 150),
                          Text("Female"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Hight"),
                        Text(
                          "$height",
                          style: kInputLableColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 100) {
                                    height--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  }
                                });
                              },
                              child: Icon(Icons.remove, size: 40),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 220) {
                                    height++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  }
                                });
                              },
                              child: Icon(Icons.add, size: 40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight"),
                        Text(
                          "$weight",
                          style: kInputLableColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 30) {
                                    weight--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  }
                                  print(weight);
                                });
                              },
                              child: Icon(Icons.remove, size: 40),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 120) {
                                    weight++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  }
                                  print(weight);
                                });
                              },
                              child: Icon(Icons.add, size: 40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text("BMI"),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: kInputLableColor.copyWith(color: koutputTextcolor),
                  ),
                  Text(getResult(bmi))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'Overweight';
    } else if (bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
