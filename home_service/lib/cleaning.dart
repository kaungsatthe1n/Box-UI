import 'package:flutter/material.dart';
import './extention.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({Key? key}) : super(key: key);

  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  var selectedBox = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 70, horizontal: 25),
              child: Text(
                'Where box do you want to clean?',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  padding: EdgeInsets.only(bottom: 30),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedBox.contains(index)) {
                              selectedBox.remove(index);
                            } else {
                              selectedBox.add(index);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.teal[(index + 1) * 100],
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  Text(
                                    'Box $index',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  selectedBox.contains(index)
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.green[100]!
                                                  .withOpacity(.6),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                              selectedBox.contains(index) && index >= 2
                                  ? Container(
                                      height: 70,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: EdgeInsets.only(left: 15),
                                          itemCount: 4,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 10),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.purple.shade900,
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: Text(
                                                '$index',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          }))
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
