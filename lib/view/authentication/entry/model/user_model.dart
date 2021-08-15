import 'package:flutter/material.dart';

import '../../../../core/base/model/base_model.dart';

class UserModel extends BaseModel {
  String id;
  String name;
  String surname;
  String email;
  String password;
  String address;
  String phone;
  bool isEmailActive;

  UserModel.empty();

  UserModel.login({
    @required this.email,
    @required this.password,
  });

  UserModel.signUp({
    @required this.name,
    @required this.surname,
    @required this.email,
    @required this.password,
    @required this.address,
    @required this.phone,
  });

  UserModel._fromJson(dynamic o) {
    id = o['_id'].toString();
    name = o['name'].toString();
    surname = o['surname'].toString();
    email = o['email'].toString();
    password = o['password'].toString();
    address = o['address'].toString();
    phone = o['phone'].toString();
    isEmailActive = (o['isEmailActive'].toString() == 'True' ||
        int.tryParse(o['isEmailActive'].toString()) == 1);
  }

  @override
  fromObject(dynamic o) => UserModel._fromJson(o);

  @override
  Map<String, dynamic> toMap() {
    final data = Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['isEmailActive'] = this.isEmailActive.toString();
    return data;
  }
}
