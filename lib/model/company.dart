import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  String? id;
  String? name;
  String? address;
  int? phone;
  Timestamp? established;
  List? services;

  Company({this.id,this.name,this.address,this.phone,this.established,this.services});
}