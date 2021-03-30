import 'package:blue_scale/entity/user.dart';


class Rentdata extends User{
  //final String uid;
  final String blk;
  final String address;
  final String phone;
  final String storey;
  final String price;

  Rentdata({this.blk,this.address,this.phone,this.storey,this.price});
}