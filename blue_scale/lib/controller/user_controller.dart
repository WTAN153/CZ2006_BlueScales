import 'dart:async';
import 'package:blue_scale/entity/DataAccess.dart';
import 'package:blue_scale/entity/user.dart';

import 'login_controller.dart';

class UserController {
  static storeRent(String blk, String address, String phone, String storey,
      String price) async {
    final user = LoginController().getCurrentUID();
    await DataAccess(uid: user)
        .updateRentData(blk, address, phone, storey, price);
  }

  static storefav(
      String blk, String address, String storey, String price) async {
    final user = LoginController().getCurrentUID();
    await DataAccess(uid: user).updatefavData(blk, address, storey, price);
  }
}
