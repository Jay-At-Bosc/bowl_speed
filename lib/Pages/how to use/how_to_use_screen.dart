// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bowl_speed/utils/labels.dart';
import 'package:bowl_speed/widgets/custom_menu_features.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to use',
          style: GoogleFonts.rubik(color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff053ac3),
        actions: [
          CustomMenuFeatures(""),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: Labels.steps.length,
            itemBuilder: (context, index) {
              if (index != 2) {
                return CustomNormalStepDescription(
                  index: index + 1,
                  description: Labels.steps[index],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${Labels.step} ${index + 1} :"),
                    SizedBox(
                      height: 4,
                    ),
                    customCardForDescription(description: Labels.steps[index]),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customButton(Labels.reachPoint),
                        customButton(Labels.reachPoint),
                      ],
                    ),
                    customCardForDescription(
                        description: Labels.descriptionThreeTwo),
                  ],
                );
              }
            }),
      ),
    );
  }

  Widget customButton(String title) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff62C201),
        foregroundColor: Colors.white,
      ),
    );
  }
}

class CustomNormalStepDescription extends StatelessWidget {
  const CustomNormalStepDescription(
      {super.key, required this.index, required this.description});

  final int index;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${Labels.step} $index :"),
        SizedBox(
          height: 4,
        ),
        customCardForDescription(description: description),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

Widget customCardForDescription({required String description}) {
  return Card(
    color: Color.fromARGB(255, 241, 252, 225),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        description,
        style: GoogleFonts.rubik(fontSize: 16, color: Colors.black),
      ),
    ),
  );
}
