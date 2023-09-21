import 'package:flutter/material.dart';
import 'package:resume_builder_app/pages/options/carrier%20objective.dart';
import 'package:resume_builder_app/pages/options/contact_info_page.dart';
import 'package:resume_builder_app/pages/resume_builder_page.dart';
import 'package:resume_builder_app/pages/resume_workspace_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    initialRoute: 'homepage',
    routes: {
      'homepage': (context) => HomePage(),
      'ResumeWorkSpace': (context) => ResumeWorkSpace(),
      'ContactInfo': (context) => ContactInfo(),
      'Carrier_Objective': (context) => Carrier_Objective(),
    },
  ));
}
