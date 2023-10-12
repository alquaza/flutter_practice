import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dice_roll/styled_text.dart';

// global variables
final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// stateful widgets always have two classes: one private and one public
class _DiceRollerState extends State<DiceRoller> {
  var currentRoll = 1;

  void rollDice() {
    // setState re-executes build function and updates parts of UI that it noticed has changed
    setState(() {
      currentRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$currentRoll.png",
          width: 200,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          child: const StyledText("Roll Dice"),
        )
      ],
    );
  }
}
