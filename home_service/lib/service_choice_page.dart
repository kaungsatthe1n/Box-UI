import 'package:flutter/material.dart';
import 'package:home_service/cleaning.dart';
import './extention.dart';

class ServiceChoice extends StatefulWidget {
  const ServiceChoice({Key? key}) : super(key: key);

  @override
  _ServiceChoiceState createState() => _ServiceChoiceState();
}

class _ServiceChoiceState extends State<ServiceChoice> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: selectedIndex >= 0
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CleaningPage();
                }));
              },
              child: Icon(
                Icons.navigate_next_sharp,
                color: Colors.teal,
              ),
            )
          : null,
      body: SafeArea(
        child: NestedScrollView(
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: selectedIndex == index
                              ? Colors.teal.shade100.withAlpha(100)
                              : Colors.teal),
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
            ],
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 70, horizontal: 25),
                  child: Text(
                    'Which box \ndo you need ?',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}
