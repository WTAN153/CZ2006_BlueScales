import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  int ecg, pg, fg, ecsg, hg, grant, predictedprice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grant Applicable'),
        ),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('Purchaseable Price',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Based on the price and after deduction due to grant',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            SizedBox(height: 10),
            Text('change to calculated price',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(
              height: 20,
            ),
            //overallcost(grant, predictedprice)
            //.toString()), //TODO change to the original-the grant()
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Original',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)) //TODO replace with predicted price
                ,
                Text(' - ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text(
                    totalgrant(
                            ecgc(ans1, text, ans3),
                            pgc(ans6),
                            fgc(ans1, text, ans3, ans2, ans5),
                            hgc(ans1, text, ans7),
                            ecgs(ans1, text, ans8))
                        .toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))
              ],
            ),
            SizedBox(
              height: 55,
            ),
            Container(
              child: Column(
                children: [
                  Text('Grant Break Down',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: Text('Enchanced House Grant',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        child: Text(ecgc(ans1, text, ans3).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: Text('Family Grant',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      SizedBox(
                        width: 122,
                      ),
                      SizedBox(
                        child: Text(
                            fgc(ans1, text, ans3, ans2, ans5).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: Text('Proximity Grant',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      SizedBox(width: 100),
                      SizedBox(
                        child: Text(pgc(ans6).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: Text('Enhanced Grant for Single',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      SizedBox(width: 25),
                      Text(ecgs(ans1, text, ans8).toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: Text('Half Housing Grant',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      SizedBox(width: 75),
                      SizedBox(
                        child: Text(hgc(ans1, text, ans7).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )));
  }

  //ans1 = firsttime, ans2 =  bighouse, ans3 = BTO, ans4 = enchanced grant, ans5 = family grant, ans6 = proximity, ans7= half house, ans8=single
  int ecgc(ans1, text, ans3) {
    int income = text;
    if ((ans1 == 'Yes') && (income <= 9000)) {
      if (income <= 1500) {
        ecg = 80000;
      } else if (income <= 2000) {
        ecg = 75000;
      } else if (income <= 2500) {
        ecg = 70000;
      } else if (income <= 3000) {
        ecg = 65000;
      } else if (income <= 3500) {
        ecg = 60000;
      } else if (income <= 4000) {
        ecg = 55000;
      } else if (income <= 4500) {
        ecg = 50000;
      } else if (income <= 5000) {
        ecg = 45000;
      } else if (income <= 5500) {
        ecg = 40000;
      } else if (income <= 6000) {
        ecg = 35000;
      } else if (income <= 6500) {
        ecg = 30000;
      } else if (income <= 7000) {
        ecg = 25000;
      } else if (income <= 7500) {
        ecg = 20000;
      } else if (income <= 8000) {
        ecg = 15000;
      } else if (income <= 8500) {
        ecg = 10000;
      } else if (income <= 9000) {
        ecg = 5000;
      }
      return ecg;
    } else {
      ecg = 0;
    }
    return ecg;
  }

  int fgc(ans1, text, ans3, ans2, ans5) {
    if ((ans1 == 'Yes') &&
        (ans3 == 'No') &&
        (ans5 == 'Yes') &&
        (text <= 14000)) {
      if (ans2 == 'Yes') {
        fg = 10000;
      } else if (ans2 == 'No') {
        fg = 50000;
      }
      return fg;
    } else {
      fg = 0;
    }
    return fg;
  }

  int pgc(ans6) {
    if (ans6 == 'Yes') {
      pg = 20000;
      return pg;
    } else {
      pg = 0;
      return pg;
    }
  }

  int hgc(ans1, text, ans7) {
    if ((ans1 == 'No') && (ans7 == 'Yes') && (text <= 14000)) {
      if (ans2 == 'Yes') {
        hg = 20000;
        return hg;
      } else if (ans2 == 'No') {
        hg = 25000;
        return hg;
      }
    } else {
      hg = 0;
      return hg;
    }
    return hg;
  }

  int ecgs(ans1, text, ans8) {
    if ((ans1 == 'No') && (ans8 == 'Yes')) {
      if (text <= 750) {
        ecsg = 40000;
        return ecsg;
      } else if (text <= 1000) {
        ecsg = 37500;
        return ecsg;
      } else if (text <= 1250) {
        ecsg = 35000;
        return ecsg;
      } else if (text <= 1500) {
        ecsg = 32500;
        return ecsg;
      } else if (text <= 1750) {
        ecsg = 30000;
        return ecsg;
      } else if (text <= 2000) {
        ecsg = 27500;
        return ecsg;
      } else if (text <= 2250) {
        ecsg = 25000;
        return ecsg;
      } else if (text <= 2500) {
        ecsg = 22500;
        return ecsg;
      } else if (text <= 2750) {
        ecsg = 20000;
        return ecsg;
      } else if (text <= 3000) {
        ecsg = 17500;
        return ecsg;
      } else if (text <= 3250) {
        ecsg = 15000;
        return ecsg;
      } else if (text <= 3500) {
        ecsg = 12500;
        return ecsg;
      } else if (text <= 3750) {
        ecsg = 10000;
        return ecsg;
      } else if (text <= 4000) {
        ecsg = 7500;
        return ecsg;
      } else if (text <= 4250) {
        ecsg = 5000;
        return ecsg;
      } else if (text <= 4500) {
        ecsg = 2500;
        return ecsg;
      } else {
        ecsg = 0;
        return ecsg;
      }
    } else {
      ecsg = 0;
    }
    return ecsg;
  }

  int totalgrant(ecg, pg, fg, hg, ecsg) {
    grant = ecg + pg + fg + hg + ecsg;
    return grant;
  }

  int overallcost(grant, predictedprice) {
    int overallcost;
    overallcost = predictedprice - grant;
    return overallcost;
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
