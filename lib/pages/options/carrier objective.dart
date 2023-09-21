import 'dart:html';

import 'package:flutter/material.dart';

import '../../globals.dart';

class Carrier_Objective extends StatefulWidget {
  const Carrier_Objective({Key? key}) : super(key: key);

  @override
  State<Carrier_Objective> createState() => _Carrier_ObjectiveState();
}

class _Carrier_ObjectiveState extends State<Carrier_Objective> {
  final TextEditingController DiscriptionController = TextEditingController();
  final TextEditingController DiscriptionController1 = TextEditingController();
  final TextEditingController DiscriptionController2 = TextEditingController();

  final TextEditingController SoftwareController = TextEditingController();

  GlobalKey<FormState> CareerObjectiveKey = GlobalKey<FormState>();
  GlobalKey<FormState> SoftwareObjectiveKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(top: 50),
                width: _width,
                height: _height,
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: Column(
                  children: [
                    Text(
                      "Carrier Objective",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 12,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: _height * 0.3,
                    width: _width,
                    color: Colors.white,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 10, left: 21),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Career Objective",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 2,
                                right: 20,
                                top: 5,
                                bottom: 10,
                              ),
                              height: 150,
                              width: _width,
                              decoration: BoxDecoration(
                                //   color: Colors.amber,
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5)),
                              ),
                              child: Form(
                                key: CareerObjectiveKey,
                                child: TextFormField(
                                  controller: DiscriptionController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please Enter your Description first";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.description = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    label: Text(
                                      "  Description",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // height: _height * 0.1,
                    width: _width,
                    color: Colors.white,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 30, left: 21),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Current Designation(Experienced\nCanditate",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                  fontSize: 15),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 2,
                                right: 20,
                                top: 6,
                                bottom: 9,
                              ),
                              height: 49,
                              width: _width,
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5)),
                              ),
                              child: Form(
                                key: SoftwareObjectiveKey,
                                child: TextFormField(
                                  controller: SoftwareController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please Enter your Software Engineer.... ";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.software = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    label: Text(
                                      "    Software Engineer",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        child: const Text("Save"),
                        onPressed: () {
                          if (CareerObjectiveKey.currentState!.validate()) {
                            CareerObjectiveKey.currentState!.save();

                            print("Description: ${Global.description}");

                            if (SoftwareObjectiveKey.currentState!.validate()) {
                              SoftwareObjectiveKey.currentState!.save();

                              print("S.E:${Global.software}");
                            }
                          }
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            CareerObjectiveKey.currentState!.reset();
                            SoftwareObjectiveKey.currentState!.reset();

                            DiscriptionController.clear();
                            SoftwareController.clear();

                            setState(() {
                              Global.description = "";
                              Global.software = "";
                            });
                          },
                          child: Text("Clear")),
                      SizedBox(
                        width: 5,
                      ),
                    ],
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
