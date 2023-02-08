import 'dart:developer';
import 'dart:math' as m;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../monsters/goblins/goblin.dart';
import '../styles/colours.dart';
import '../styles/textstyles.dart';

//COMBAT MENU
//==============================================================================
//This page will be used by the user to track their combats
//
//There should be button options at the top of the page for creating a combat
//encounter, clearing the current combat encounter, and adding a unit to the
//encounter.
//
//Monsters are hard coded into the app as classes. To display the stat block of
//a monster, the class will have a method to build a widget with all the
//required elements. Dice rolls are a possibility, but it's more fun to roll
//the dice irl so that would be a low priority feature.
//
//Monster compositions should be savable and able to be retrieved later, eg.
//a user chooses 3 goblins and a hobgoblin for an encounter and saves it. Later,
//during the session they can pull up this combat without having to manually
//recreate it.
//
//Main page content should be the stat block of monster whose turn it is. When
//it is a player's turn, it should state the name of the player. The monster's
//stat block is a
//
//==============================================================================

class CombatMenu extends StatefulWidget {
  const CombatMenu({super.key,});

  @override
  State<CombatMenu> createState() => _CombatMenuState();
}

class _CombatMenuState extends State<CombatMenu> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  List<Widget> monsters = [];

  void addMonster() {
    Goblin r = Goblin();
    monsters.add(r.statBlock());
  }

  @override
  Widget build(BuildContext context) {

    Widget pageContent() {
      //Structure is:
      //TOP MENU BUTTONS
      //MONSTER STAT BLOCK
      //SPINNING DISPLAY SHOWING INITIATIVE ORDER

      return Container(
          child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      addMonster();
                    });
                  },
                  child: const Text('Add')
                ),
                Column(
                  children: monsters.isNotEmpty ? monsters : [],
                ),
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