import 'package:flutter/material.dart';
import 'package:bluescales/main.dart';
import 'package:blue_scale/screen/calculator/calculatorscreen.dart';

// class GrantPage extends StatefulWidget {
//   @override
//   GrantPageWidget createState() => GrantPageWidget();
// }

class GrantPage extends StatelessWidget {
  final int text;
  final String ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8;
  GrantPage({
    Key key,
    @required this.text,
    @required this.ans1,
    @required this.ans2,
    @required this.ans3,
    @required this.ans4,
    @required this.ans5,
    @required this.ans6,
    @required this.ans7,
    @required this.ans8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grant Applicable'),
        ),
        body: Center(
            child: Column(
          children: [
            Text('Purchaseable Price'),
            Text('Based on the price and after deduction due to grant'),
            Text('calculated price'), //TODO change to the original-the grant()
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Original'), Text(' - '), Text('hceck')],
            ),
            Container(
              child: Column(
                children: [
                  Text('Grant Break Down'),
                  Row(
                    children: [Text('Enchanced House Grant')],
                  ),
                  Row(
                    children: [
                      Text('Family Grant'),
                    ],
                  ),
                  Row(
                    children: [Text('Proximity Grant')],
                  ),
                  Row(
                    children: [Text('Enhanced Grant for Single')],
                  ),
                  Row(
                    children: [Text('Half Housing Grant')],
                  )
                ],
              ),
            ),
          ],
        )));
  }

  Widget breakdown(firsttime) {
    return Container();
  }

//   String grant(text, ans1, ans2, ans3, ans4, ans5) {
//     //assume these parameters are given
//     int familygrant, proximitygrant, firsttime, bighouse, bto;
//     int totalgrant; // grant to be calculcated
//     int income = text;
//     int ecg, pg, fg;

//     //ans1 is first time
//     if (ans1 == 'Yes')
//       firsttime = 1;
//     else
//       firsttime = 0;

//     //ans2 is about family grant
//     if (ans2 == 'Yes')
//       familygrant = 1;
//     else
//       familygrant = 0;

//     //ans3 is about proximity grant
//     if (ans3 == 'Yes')
//       proximitygrant = 1;
//     else
//       proximitygrant = 0;

//     //ans4 is about bto
//     if (ans4 == 'Yes')
//       bto = 1;
//     else
//       bto = 0;
//     //ans5 is about bighouse
//     if (ans5 == 'Yes')
//       bighouse = 1;
//     else
//       bighouse = 0;

//     //check if couplegrant can go ahead for bto
//     if ((income <= 9000) && (firsttime == 1) && (bto == 1)) {
//       if (income <= 1500) {
//         ecg = 80000;
//         totalgrant = 80000;
//       } else if (income <= 2000) {
//         ecg = 75000;
//         totalgrant = 75000;
//       } else if (income <= 2500) {
//         ecg = 70000;
//         totalgrant = 70000;
//       } else if (income <= 3000) {
//         ecg = 65000;
//         totalgrant = 65000;
//       } else if (income <= 3500) {
//         ecg = 60000;
//         totalgrant = 60000;
//       } else if (income <= 4000) {
//         totalgrant = 55000;
//       } else if (income <= 4500) {
//         totalgrant = 50000;
//       } else if (income <= 5000) {
//         totalgrant = 45000;
//       } else if (income <= 5500) {
//         totalgrant = 40000;
//       } else if (income <= 6000) {
//         totalgrant = 35000;
//       } else if (income <= 6500) {
//         totalgrant = 30000;
//       } else if (income <= 7000) {
//         totalgrant = 25000;
//       } else if (income <= 7500) {
//         totalgrant = 20000;
//       } else if (income <= 8000) {
//         totalgrant = 15000;
//       } else if (income <= 8500) {
//         totalgrant = 10000;
//       } else if (income <= 9000) {
//         totalgrant = 5000;
//       }
//       String answer = "$totalgrant";
//       return answer;
//     }

//     //resale flat, check for ECG + proximity + family grant for less than 9k
//     if ((income <= 9000) && (firsttime == 1)) {
//       if (income <= 1500) {
//         totalgrant = 80000;
//       } else if (income <= 2000) {
//         totalgrant = 75000;
//       } else if (income <= 2500) {
//         totalgrant = 70000;
//       } else if (income <= 3000) {
//         totalgrant = 65000;
//       } else if (income <= 3500) {
//         totalgrant = 60000;
//       } else if (income <= 4000) {
//         totalgrant = 55000;
//       } else if (income <= 4500) {
//         totalgrant = 50000;
//       } else if (income <= 5000) {
//         totalgrant = 45000;
//       } else if (income <= 5500) {
//         totalgrant = 40000;
//       } else if (income <= 6000) {
//         totalgrant = 35000;
//       } else if (income <= 6500) {
//         totalgrant = 30000;
//       } else if (income <= 7000) {
//         totalgrant = 25000;
//       } else if (income <= 7500) {
//         totalgrant = 20000;
//       } else if (income <= 8000) {
//         totalgrant = 15000;
//       } else if (income <= 8500) {
//         totalgrant = 10000;
//       } else if (income <= 9000) {
//         totalgrant = 5000;
//       }
//       if (proximitygrant == 1) {
//         totalgrant = 20000 + totalgrant;
//       }
//       if ((familygrant == 1) && (bighouse == 1)) {
//         totalgrant = totalgrant + 5000;
//       } else if ((familygrant == 1) && (bighouse == 0)) {
//         totalgrant = totalgrant + 50000;
//       }
//       String answer = "$totalgrant";
//       return answer;
//     }

//     //resale flat, but income : 9k< income <14k
//     if ((income <= 14000) && (firsttime == 1)) {
//       if (bighouse == 1) {
//         totalgrant = 10000;
//       } else if (bighouse == 0) {
//         totalgrant = 50000;
//       }
//       if (proximitygrant == 1) {
//         totalgrant = totalgrant + 20000;
//       }
//       String answer = "$totalgrant";
//       return answer;
//     }
//   }
// }

// String ecgnumber(ans2){
//   if ans2
// }

// String familynumber(ans2,ans4){
//   if ans2

}
