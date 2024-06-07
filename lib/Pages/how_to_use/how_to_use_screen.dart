// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/utils/labels.dart';
import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:bowl_speed/widgets/custom_menu_features.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Labels.howToUse,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
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
                    Text(
                      "${Labels.step} ${index + 1} :",
                      style: GoogleFonts.rubik(fontSize: 16),
                    ),
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
                    const SizedBox(
                      height: 8,
                    )
                  ],
                );
              }
            }),
      ),
    );
  }

  Widget customButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          backgroundColor: AppColors.orangeColor,
          foregroundColor: Colors.white,
        ),
        child: Text(
          title,
          style: GoogleFonts.rubik(fontSize: 16),
        ),
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
        Text("${Labels.step} $index :", style: GoogleFonts.rubik(fontSize: 16)),
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
  return Container(
    padding: EdgeInsets.all(6.0),
    decoration: BoxDecoration(
        color: AppColors.blueColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        description,
        style: GoogleFonts.rubik(fontSize: 16, color: Colors.black),
      ),
    ),
  );
}
