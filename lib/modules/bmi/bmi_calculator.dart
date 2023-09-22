import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/modules/bmi_result/bmi_result_screen.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double valueSlider = 120;
  int weightValue = 40;
  int ageValue = 20;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb0a0d22),
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/male.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF8a8b95),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff1d1f33),
                          border: isMale
                              ? Border.all(color: Color(0xffeb1555), width: 2)
                              : Border.symmetric(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/female.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF8a8b95),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff1d1f33),
                          border: !isMale
                              ? Border.all(color: Color(0xffeb1555), width: 2)
                              : Border.symmetric(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff1d1f33),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF8a8b95),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${valueSlider.round()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF8a8b95),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Color(0xffeb1555),
                      value: valueSlider,
                      max: 220,
                      min: 80,
                      onChanged: (value) {
                        setState(() {
                          print(value.round());
                          valueSlider = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff1d1f33),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF8a8b95),
                            ),
                          ),
                          Text(
                            '$weightValue',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: const Color(0xff424555),
                                onPressed: () {
                                  setState(() {
                                    weightValue--;
                                    print(weightValue);
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                heroTag: 'weight--',
                                mini: true,
                              ),
                              FloatingActionButton(
                                backgroundColor: const Color(0xff424555),
                                onPressed: () {
                                  setState(() {
                                    weightValue++;
                                    print(weightValue);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                mini: true,
                                heroTag: 'weight++',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff1d1f33),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF8a8b95),
                            ),
                          ),
                          Text(
                            '$ageValue',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: const Color(0xff424555),
                                onPressed: () {
                                  setState(() {
                                    ageValue--;
                                    print(ageValue);
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                mini: true,
                                heroTag: 'age--',
                              ),
                              FloatingActionButton(
                                backgroundColor: const Color(0xff424555),
                                onPressed: () {
                                  setState(() {
                                    ageValue++;
                                    print(ageValue);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                mini: true,
                                heroTag: 'age++',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Color(0xffeb1555),
            child: MaterialButton(
              height: 60,
              onPressed: () {
                var result = weightValue / pow(valueSlider / 100, 2);
                print(result.round());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMIResultScreen(
                      age: ageValue,
                      isMale: isMale,
                      result: result,
                    ),
                  ),
                );
              },
              child: const Text(
                'CALCULATE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // var result = weight / pow(height /100 , 2);
//print(result.round());
}
