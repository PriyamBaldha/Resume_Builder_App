import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder_app/globals.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  final ImagePicker _picker = ImagePicker();

  int initialIndex = 0;

  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Resume Workspace",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50),
                  InkWell(
                    onTap: () {
                      setState(() {
                        initialIndex = 0;
                      });
                    },
                    child: Text(
                      "Contact",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        initialIndex = 1;
                      });
                    },
                    child: const Text("Photo",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                  SizedBox(width: 50),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Container(
              child: IndexedStack(
                index: initialIndex,
                children: [
                  //Contact UI
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        height: _height * 0.5,
                        width: _width,
                        color: Colors.white,
                        child: Form(
                          key: contactFormKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your name first";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.name = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  label: Text("Name"),
                                  icon: Icon(Icons.people),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your name email";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.email = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  label: Text("Email"),
                                  icon: Icon(Icons.email),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your name first";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.phone = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Number",
                                  label: Text("Number"),
                                  icon: Icon(Icons.phone),
                                ),
                              ),
                              TextFormField(
                                controller: address1Controller,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your name first";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.address1 = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Address",
                                  label: Text("Address(Street,Building No)"),
                                  icon: Icon(Icons.people),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 41),
                                child: TextFormField(
                                    controller: address2Controller,
                                    decoration: InputDecoration(
                                      hintText: "Address",
                                      label: Text("Address Line 2"),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 41),
                                child: TextFormField(
                                    controller: address3Controller,
                                    decoration: InputDecoration(
                                      hintText: "Address",
                                      label: Text("Address Line 3"),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            child: const Text("Save"),
                            onPressed: () {
                              if (contactFormKey.currentState!.validate()) {
                                contactFormKey.currentState!.save();

                                print("Name: ${Global.name}");
                                print("Email: ${Global.email}");
                                print("Phone No: ${Global.phone}");
                                print("Address: ${Global.address1}");
                                print("Address: ${Global.address2}");
                                print("Address: ${Global.address3}");
                              }
                            },
                          ),
                          ElevatedButton(
                              onPressed: () {
                                contactFormKey.currentState!.reset();

                                nameController.clear();
                                emailController.clear();
                                phoneController.clear();
                                address1Controller.clear();
                                address2Controller.clear();
                                address3Controller.clear();

                                setState(() {
                                  Global.name = "";
                                  Global.email = "";
                                  Global.phone = "";
                                  Global.address1 = "";
                                  Global.address2 = "";
                                  Global.address3 = "";
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
                  //Photo UI
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        height: _height * 0.20,
                        width: _width,
                        color: Colors.white,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage: (Global.image != null)
                                  ? FileImage(Global.image!)
                                  : null,
                              radius: 60,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              child: (Global.image != null)
                                  ? const Text(
                                      "ADD",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text("Add"),
                            ),
                            FloatingActionButton(
                              child: const Icon(Icons.add),
                              mini: true,
                              onPressed: () async {
                                XFile? pickedFile = await _picker.pickImage(
                                    source: ImageSource.gallery);

                                setState(() {
                                  Global.image = File(pickedFile!.path);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Save"))
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
