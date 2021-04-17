import 'package:blue_scale/screen/calculator/grantpage.dart';
import 'package:flutter/material.dart';
import 'package:blue_scale/controller/calculator.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalculatorOptions extends StatefulWidget {
  String price;
  CalculatorOptions(this.price);
  @override
  CalculatorOptionsWidget createState() => CalculatorOptionsWidget();
}

class CalculatorOptionsWidget extends State<CalculatorOptions> {
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
  String ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9;
  String originalprice;
  final Color themeColor = Color(0xFFFFF3E0);

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
          dropdownValue6 = newValue6;
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
      //print('Hello!');
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
    //print(widget.price);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
          title: Text(
            'Grant Calculator Options',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        backgroundColor: themeColor,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height / 100 * 1),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 2,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(
                children: [
                  Text('Both First time buyers?',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16)),
                  SizedBox(width: MediaQuery.of(context).size.width / 100 * 33),
                  dropButton(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 2,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(
                children: [
                  Text('Average Gross Monthly Income ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16)),
                  Container(
                    width: MediaQuery.of(context).size.width / 100 * 33,
                    height: MediaQuery.of(context).size.height / 100 * 5,
                    child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Monthly HouseHold Income',
                        ),
                        controller: textFieldController,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please enter some numbers!");
                            return 'Please enter some numbers';
                          }
                          return null;
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 0.5,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(
                children: [
                  Text('Buying 5-room flat or bigger?',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 100 * 21.7),
                  dropButton2()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 0.5,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(children: [
                Text('BTO?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16)),
                btoinfo(context),
                SizedBox(width: MediaQuery.of(context).size.width / 100 * 58),
                dropButton3()
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 0.5,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(
                children: [
                  Text('Enhanced Housing Grant? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16)),
                  ehgcouple(context),
                  SizedBox(width: MediaQuery.of(context).size.width / 100 * 20),
                  dropButton4()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 0.5,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(
                children: [
                  Text('Family Grant? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16)),
                  familyg(context),
                  SizedBox(width: MediaQuery.of(context).size.width / 100 * 42),
                  dropButton5()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 0.5,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(children: [
                Text('Proximity Grant? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16)),
                proxig(context),
                SizedBox(width: MediaQuery.of(context).size.width / 100 * 36),
                dropButton6()
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 0.5,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(children: [
                Text('Half Housing Grant? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16)),
                halfhouseg(context),
                SizedBox(width: MediaQuery.of(context).size.width / 100 * 29),
                dropButton7()
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 100 * 5,
                bottom: MediaQuery.of(context).size.height / 100 * 0.5,
                top: MediaQuery.of(context).size.height / 100,
              ),
              child: Row(children: [
                Text('Enhanced Housing Grant(Single)? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16)),
                echsingle(context),
                SizedBox(width: MediaQuery.of(context).size.width / 100 * 4.5),
                dropButton8()
              ]),
            ),
            TextButton(
                onPressed: () {
                  try {
                    _sendDataToSecondScreen(context);
                  } catch (e) {
                    Fluttertoast.showToast(msg: "Please enter some numbers!");
                  }
                },
                child: Text('Calculate'),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))))
          ] //TODO TEXTFIELD
              ),
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
    originalprice = widget.price;
    //print(originalprice);
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
            ans9: originalprice,
            text: textToSend,
          ),
        ));
  }
}
