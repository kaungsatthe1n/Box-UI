import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:home_service/service_choice_page.dart';
import './extention.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (_) {
      setState(() {
        selectedIndex = Random().nextInt(9);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .45,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color:
                          selectedIndex == index ? Colors.white : Colors.teal),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedIndex == index
                              ? Colors.teal
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Box $index',
                        style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.teal
                                : Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ).ripple(() {
                  setState(() {
                    selectedIndex = index;
                  });
                }, borderRadius: 20.0);
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50), left: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'Easy, reliable way to take care of your home',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                        'We provide you with the best people to help take care of your home'),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 90),
                    elevation: 0,
                    height: 50,
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ServiceChoice();
                      }));
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
