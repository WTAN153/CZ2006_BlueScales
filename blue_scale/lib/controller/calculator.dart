import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blue_scale/screen/calculator/calculatorscreen.dart';

class Calculator {
  final bool firsttime; //both first time
  final int monthly;
  final bool fivehouse;
  Calculator(this.firsttime, this.monthly, this.fivehouse);
}

Widget calculatorbutton() {
  return TextButton(
      onPressed: () {
        //TODO on pressed to go to function page
      },
      child: Text('Grant Calculator'),
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))));
}

/// This is the stateful widget that the main application instantiates.
class FirstTime extends StatefulWidget {
  const FirstTime({Key key}) : super(key: key);

  @override
  _FirstTimeState createState() => _FirstTimeState();
}

/// This is the private State class that goes with FirstTime.
class _FirstTimeState extends State<FirstTime> {
  String dropdownValue = 'Yes';
  String holder = '';

  //function to get the dropdown value for us to integrate
  void getdropdownvalue() {
    setState(() {
      holder = dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// Various tool tip for the calculator
Widget ehgcouple(BuildContext context) {
  return const Tooltip(
    message:
        'Grant of 5k~80k (depending on income) if both are first time and gross monthly income <9k for a year',
    child: Icon(Icons.info_outline),
  );
}

Widget familyg(BuildContext context) {
  return const Tooltip(
    message:
        'Grant of 50k unless applying for 5-room flat or bigger (10k in this scenario) if both are first time and gross monthly income < 14k for a year',
    child: Icon(Icons.info_outline),
  );
}

Widget proxig(BuildContext context) {
  return const Tooltip(
    message:
        'Grant of 20k when living within 4km of parents/children , 30k when living with them',
    child: Icon(Icons.info_outline),
  );
}

Widget halfhouseg(BuildContext context) {
  return const Tooltip(
    message:
        'Grant of 25k unless applying for 5-room flat or bigger (5k in this scenario) one person must be first time and the other is second time applying, with gross monthly income capped at 14k ',
    child: Icon(Icons.info_outline),
  );
}

Widget stepupg(BuildContext context) {
  return const Tooltip(
    message:
        'only for couples who are living in a two-room subsidised flat and wish to apply for a new 3-room flat in a non-mature estate.',
    child: Icon(Icons.info_outline),
  );
}

Widget echsingle(BuildContext context) {
  return const Tooltip(
    message:
        '2.5k ~ 45k if one person is a first timer and the another is second-timer + average monthly household income < 4.5k',
    child: Icon(Icons.info_outline),
  );
}

Widget topupg(BuildContext context) {
  return const Tooltip(
    message:
        'Family Grant amount you eligible for, minus any previously received grant amounts. Only those with monthly household income capped at 14k are eligible',
    child: Icon(Icons.info_outline),
  );
}

Widget btoinfo(BuildContext context) {
  return const Tooltip(
    message:
        'BTO only allows for Enhanced Housing Grant and no more grants are included in the calculation',
    child: Icon(Icons.info_outline),
  );
}

Widget money() {
  return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Monthly HouseHold Income',
      ),
      onSaved: (String value) {
        // to retrieve value?
      },
      validator: (String value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some numbers';
        }
        return null;
      });
}
