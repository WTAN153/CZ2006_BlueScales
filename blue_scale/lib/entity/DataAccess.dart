
import 'package:cloud_firestore/cloud_firestore.dart';
import'package:blue_scale/entity/user.dart';
import'package:blue_scale/entity/favdata.dart';

import 'Rent.dart';


//this is the function of getting the data from the firestore
class DataAccess {

  final String uid; // get the uid that the app going to access the firestore
  DataAccess({this.uid});

  final CollectionReference infoCollection = FirebaseFirestore.instance
      .collection('info');

  Future updateUserData(String email, String name, String phone) async {
    return await infoCollection.doc(uid).set(
        { // create a doc in the firestore with current user id
          'email': email,
          'name': name,
          'phone': phone
          // bookmark , house listing all store here
        });
  }

  Future updateRentData(String blk, String address, String phone, String storey,
      String price) async {
    return await infoCollection.doc(uid).update(
        { // updating the current existing database with additional data
          'blk': blk,
          'address': address,
          'storey': storey,
          'phone': phone,
          'price': price
        });
  }


// furture data that link to user like bookmark and review all user
  List<Userdatabase> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Userdatabase(
          email: doc.data()['email']
      );
    }).toList();
  }

//User profile snapshot for this user
  Userprofiledata _userprofileFromSnapshot(DocumentSnapshot snapshot) {
    return Userprofiledata(
        uid: uid,
        email: snapshot.data()['email'],
        name: snapshot.data()['name'],
        phone: snapshot.data()['phone']
    );
  }


  List<Rentdata> _rentdataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Rentdata(
          blk: doc.data()['blk'],
          address: doc.data()['address'],
          phone: doc.data()['phone'],
          storey: doc.data()['storey'],
          price: doc.data()['price']??'negotiable'
      );
    }).toList();
  }


  Stream<List<Userdatabase>> get info {
    return infoCollection.snapshots().map(
        _userListFromSnapshot); // to out check on the firestore
  }

  Stream<Userprofiledata> get userData {
    return infoCollection.doc(uid).snapshots().map(
        _userprofileFromSnapshot); // check on the firestore base on the uid(current user)
  }

  Stream<List<Rentdata>> get rentDatas {
    return infoCollection.snapshots().map(
        _rentdataFromSnapshot); // check on the firestore base on the uid(current user)
  }



  Future updatefavData(String blk, String address, String storey,
      String price) async {
    return await infoCollection.doc(uid).update(
        { // updating the current existing database with additional data
          'fblk': blk,
          'faddress': address,
          'fstorey': storey,
          'fprice': price
        });
  }
 /* Userprofiledata _userprofileFromSnapshot(DocumentSnapshot snapshot) {
    return Userprofiledata(
        uid: uid,
        email: snapshot.data()['email'],
        name: snapshot.data()['name'],
        phone: snapshot.data()['phone']
    );
  }*/

  favdata _favdataFromSnapshot(DocumentSnapshot snapshot) {

      return favdata(
          uid: uid,
          fblk: snapshot.data()['fblk'],
          faddress: snapshot.data()['faddress'],

          fstorey: snapshot.data()['fstorey'],
          fprice: snapshot.data()['fprice']
      );

  }


  Stream<favdata> get userfData {
    return infoCollection.doc(uid).snapshots().map(
        _favdataFromSnapshot); // check on the firestore base on the uid(current user)
  }



}








