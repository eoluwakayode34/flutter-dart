import 'dart:math';

import 'package:diceapp/style_text.dart';
import 'package:flutter/material.dart';

final randomMiniser = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceRoll = 1;
  roleDice() {
    setState(() {
      diceRoll = randomMiniser.nextInt(6) + 1;
    });

    if (diceRoll == 6) {
      return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Omo see 6 🤩⚡️😍 '),
          content: const Text('Challenge 1, how far Adebola'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    return;
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/images/dice-$diceRoll.png',
          width: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: roleDice,
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 24)),
            child: const StyleText('Roll Dice'))
      ],
    );
  }
}
