import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harry_dnd_assistant/dice_rolls/dice.dart';
import 'package:harry_dnd_assistant/styles/colours.dart';
import 'package:harry_dnd_assistant/styles/textstyles.dart';

import '../../shared_tools/tools.dart';

class Goblin {
  //Define main stat fields
  String? name;
  String? cr;
  String? size;
  int? ac;
  int? hp;
  int? speed;
  int? str;
  int? dex;
  int? con;
  int? intel;
  int? wis;
  int? cha;


  Goblin() {
    //Goblins have a base AC of 15, base HP of 2d6, and 30ft movement
    //Goblins have base stats
    name = 'Goblin';
    cr = '1/4';
    size = 'Small';
    ac = 15;
    hp = rollD6() + rollD6();
    speed = 30;

    str = 8;
    dex = 14;
    con = 10;
    intel = 10;
    wis = 8;
    cha = 8;
  }

  //Methods for monitoring the hp of this monster
  takeDamage(int damage) {
    hp = hp! - damage;
  }
  healDamage(int damage) {
    hp = hp! + damage;
  }

  //Widget builder for the goblin's stat block
  Widget statBlock() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(5.0, 5.0),
                blurRadius: 24.0
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity, height: 50,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                      color: elementColour
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                        alignment: Alignment.center, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(flex: 1, child: Text(name!, style: mainContentText, overflow: TextOverflow.ellipsis,)),
                        Flexible(flex:1, child: Text(cr!, style: mainContentText, overflow: TextOverflow.ellipsis,),)
                      ],
                    )
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.favorite, color: elementColour,),
                          Text(hp.toString(), style: detailContentText, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      Column(
                          children: [
                            Icon(Icons.shield, color: elementColour,),
                            Text(ac.toString(), style: detailContentText, overflow: TextOverflow.ellipsis,),
                          ]
                      ),
                      Column(
                          children: [
                            Icon(Icons.bolt, color: elementColour,),
                            Text(speed.toString(), style: detailContentText, overflow: TextOverflow.ellipsis,)
                          ]
                      ),
                    ]
                ),
                const SizedBox(height: 12.0),
                lineOut,
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Need a column per stat
                    Column(
                      children: [
                        Text('MOD', style: mainHeaderText),
                        Text(str.toString(), style: detailContentText),
                        Text('STR', style: mainHeaderText,),
                      ],
                    ),
                    Column(
                      children: [
                        Text('MOD', style: mainHeaderText),
                        Text(dex.toString(), style: detailContentText),
                        Text('DEX', style: mainHeaderText,),
                      ],
                    ),
                    Column(
                      children: [
                        Text('MOD', style: mainHeaderText),
                        Text(con.toString(), style: detailContentText),
                        Text('CON', style: mainHeaderText,),
                      ],
                    ),
                    Column(
                      children: [
                        Text('MOD', style: mainHeaderText),
                        Text(intel.toString(), style: detailContentText),
                        Text('INT', style: mainHeaderText,),
                      ],
                    ),
                    Column(
                      children: [
                        Text('MOD', style: mainHeaderText),
                        Text(wis.toString(), style: detailContentText),
                        Text('WIS', style: mainHeaderText,),
                      ],
                    ),
                    Column(
                      children: [
                        Text('MOD', style: mainHeaderText),
                        Text(cha.toString(), style: detailContentText),
                        Text('CHA', style: mainHeaderText,),
                      ],
                    ),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: elementColour,
                        shape: const StadiumBorder(),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Text('Take Damage',),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: elementColour,
                        shape: const StadiumBorder(),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Text('Heal Damage',),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}