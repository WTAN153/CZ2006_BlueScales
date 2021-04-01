import 'package:blue_scale/screen/calculator/grantscreen.dart';
import 'package:flutter/material.dart';
import 'package:blue_scale/screen/calculator/calculator.dart';
import 'package:flutter/services.dart';

class CalculatorOptions extends StatefulWidget {
  @override
  CalculatorOptionsWidget createState() => CalculatorOptionsWidget();
}

class CalculatorOptionsWidget extends State {
  TextEditingController textFieldController = TextEditingController();
  String dropdownValue = 'Yes',
      dropdownValue2 = 'Yes',
      dropdownValue3 = 'Yes',
      dropdownValue4 = 'Yes',
      dropdownValue5 = 'Yes',
      dropdownValue6 = 'Yes',
      dropdownValue7 = 'Yes',
      dropdownValue8 = 'Yes';
  String holder, holder2, holder3, holder4, holder5, holder6, holder7, holder8;
  String ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8;

  Widget dropButton() {
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

  Widget dropButton2() {
    return DropdownButton<String>(
      value: dropdownValue2,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue2) {
        setState(() {
          dropdownValue2 = newValue2;
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value2) {
        return DropdownMenuItem<String>(
          value: value2,
          child: Text(value2),
        );
      }).toList(),
    );
  }

  Widget dropButton3() {
    return DropdownButton<String>(
      value: dropdownValue3,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue3) {
        setState(() {
          dropdownValue3 = newValue3;
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value3) {
        return DropdownMenuItem<String>(
          value: value3,
          child: Text(value3),
        );
      }).toList(),
    );
  }

  Widget dropButton4() {
    return DropdownButton<String>(
      value: dropdownValue4,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue4) {
        setState(() {
          dropdownValue4 = newValue4;
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value4) {
        return DropdownMenuItem<String>(
          value: value4,
          child: Text(value4),
        );
      }).toList(),
    );
  }

  Widget dropButton5() {
    return DropdownButton<String>(
      value: dropdownValue5,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue5) {
        setState(() {
          dropdownValue5 = newValue5;
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value5) {
        return DropdownMenuItem<String>(
          value: value5,
          child: Text(value5),
        );
      }).toList(),
    );
  }

  Widget dropButton6() {
    return DropdownButton<String>(
      value: dropdownValue6,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue6) {
        setState(() {
          dropdownValue5 = newValue6;
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value6) {
        return DropdownMenuItem<String>(
          value: value6,
          child: Text(value6),
        );
      }).toList(),
    );
  }

  Widget dropButton7() {
    return DropdownButton<String>(
      value: dropdownValue7,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue7) {
        setState(() {
          dropdownValue7 = newValue7;
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value7) {
        return DropdownMenuItem<String>(
          value: value7,
          child: Text(value7),
        );
      }).toList(),
    );
  }

  Widget dropButton8() {
    return DropdownButton<String>(
      value: dropdownValue8,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue8) {
        setState(() {
          dropdownValue8 = newValue8;
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value8) {
        return DropdownMenuItem<String>(
          value: value8,
          child: Text(value8),
        );
      }).toList(),
    );
  }

  String getDropDownItem() {
    setState(() {
      holder = dropdownValue;
      print('Hello!');
    });

    return holder;
  }

  String getDropDownItem2() {
    setState(() {
      holder2 = dropdownValue2;
    });

    return holder2;
  }

  String getDropDownItem3() {
    setState(() {
      holder3 = dropdownValue3;
    });

    return holder3;
  }

  String getDropDownItem4() {
    setState(() {
      holder4 = dropdownValue4;
    });

    return holder4;
  }

  String getDropDownItem5() {
    setState(() {
      holder5 = dropdownValue5;
    });

    return holder5;
  }

  String getDropDownItem6() {
    setState(() {
      holder6 = dropdownValue6;
    });

    return holder6;
  }

  String getDropDownItem7() {
    setState(() {
      holder7 = dropdownValue7;
    });

    return holder7;
  }

  String getDropDownItem8() {
    setState(() {
      holder8 = dropdownValue8;
    });

    return holder8;
  }

  // String getAns1() {
  //   holder = ans1;
  //   return ans1;
  // }

  // String getAns2() {
  //   holder2 = ans2;
  //   return ans2;
  // }

  // String getAns3() {
  //   holder3 = ans3;
  //   return ans3;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grant Calculator Options'),
        ),
        body: Column(children: [
          Row(
            children: [
              Text('Both First time buyers?'),
              dropButton(),
            ],
          ),
          Row(
            children: [
              Text('Average Gross Monthly Income'),
              Container(
                width: 180,
                height: 40.0,
                child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Monthly HouseHold Income',
                    ),
                    controller: textFieldController,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some numbers';
                      }
                      return null;
                    }),
              ),
            ],
          ),
          Row(
            children: [Text('Buying 5-room flat or bigger?'), dropButton2()],
          ),
          Row(children: [Text('BTO?'), topupg(context), dropButton3()]),
          Row(
            children: [
              Text('Enhanced Housing Grant? '),
              ehgcouple(context),
              dropButton4()
            ],
          ),
          Row(
            children: [Text('Family Grant? '), familyg(context), dropButton5()],
          ),
          Row(children: [
            Text('Proximity Grant? '),
            proxig(context),
            dropButton6()
          ]),
          Row(children: [
            Text('Half Housing Grant? '),
            halfhouseg(context),
            dropButton7()
          ]),
          Row(children: [
            Text('Enhanced Housing Grant for single'),
            echsingle(context),
            dropButton8()
          ]),
          TextButton(
              onPressed: () {
                _sendDataToSecondScreen(context);
              },
              child: Text('Calculate!'),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))))
        ] //TODO TEXTFIELD
            ));
  }

  void _sendDataToSecondScreen(BuildContext context) {
    int textToSend = int.parse(textFieldController.text);
    getDropDownItem();
    getDropDownItem2();
    getDropDownItem3();
    getDropDownItem4();
    getDropDownItem5();
    getDropDownItem6();
    getDropDownItem7();
    getDropDownItem8();
    ans1 = holder;
    ans2 = holder2;
    ans3 = holder3;
    ans4 = holder4;
    ans5 = holder5;
    ans6 = holder6;
    ans7 = holder7;
    ans8 = holder8;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GrantPage(
            ans1: ans1,
            ans2: ans2,
            ans3: ans3,
            ans4: ans4,
            ans5: ans5,
            ans6: ans6,
            ans7: ans7,
            ans8: ans8,
            text: textToSend,
          ),
        ));
  }
}
