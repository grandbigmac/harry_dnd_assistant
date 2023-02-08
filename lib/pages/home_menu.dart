import 'dart:developer';
import 'dart:math' as m;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harry_dnd_assistant/styles/buttonstyles.dart';
import 'package:page_transition/page_transition.dart';

import '../dice_rolls/dice.dart';
import '../styles/colours.dart';
import '../styles/textstyles.dart';
import 'combat_menu.dart';

//HOMEPAGE
//==============================================================================
//This is the first page that will open on app start
//
//It will provide a simple menu where the user can:
//  A) Navigate to the combat menu where:-
//      Units can be added to an initiative tracker
//      Turns can be progressed, if it is a monster (dm controlled character) turn,
//      then the stat block for that monster is displayed
//
//  B) View a list of monsters registered in the app (monsters for now will be
//      hard coded into the app, maybe later down the line they can be creatable?
//
//  C) More features I haven't thought of that are outside the scope of what I
//      want done for the oneshot
//
//==============================================================================

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key,});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  Widget navCombat() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          //Navigate to the combat menu
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.leftToRightWithFade,
              alignment: Alignment.topCenter,
              child: const CombatMenu(),
            ),
          );
        },
        style: mainButtonStyle,
        child: const Text('COMBAT'),
      )
    );
  }



  @override
  Widget build(BuildContext context) {

    Widget pageContent() {
      //Basically a list of buttons to navigate to the app functionalities

      return Container(
          child: Column(
              children: [
                Text('Select a menu option.', style: mainContentText),
                navCombat(),
              ]
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerColour,
        title: const Text('DND Combat Helper'),
      ),
      backgroundColor: backgroundColour,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            pageContent(),
          ],
        ),
      ),
    );
  }
}