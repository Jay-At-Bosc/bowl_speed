// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/settings_controller.dart';
import '../../utils/labels.dart';
import '../../widgets/custom_menu_features.dart';
import 'custom_radio_select_game.dart';
import 'custom_tile_change_pitch.dart';


class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Labels.settings,
          style: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff006769),
        actions: [
          CustomMenuFeatures(""),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// select Game
            Text(
              Labels.selectGameType,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0,
            ),

            /// Two radio button options
            ListTile(
              contentPadding: EdgeInsets.zero,
              tileColor: Colors.amber[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomRadioButton(
                      value: Sport.cricket,
                      label: Labels.cricket,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomRadioButton(
                      value: Sport.baseBall,
                      label: Labels.baseBall,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),

            /// pitch size set label
            Text(
              Labels.setDefaultPitchmeter,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4.0,
            ),

            /// pitch size set
            CustomTile(
                label: Labels.cricket, onTap: () => controller.onCricket()),
            SizedBox(
              height: 8.0,
            ),
            CustomTile(
                label: Labels.baseBall, onTap: () => controller.onBaseBall()),
          ],
        ),
      ),
    );
  }
}



