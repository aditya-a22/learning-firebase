import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  String? id;
  String? name;
  String? address;
  int? phone;
  Timestamp? established;
  List? services;

  Company({this.id,this.name,this.address,this.phone,this.established,this.services});

  toJson(){
    Map<String,dynamic> json={};
    json['name']=name;
    json['id']=id;
    json['address']=address;
    json['services']=services;
    json['established']=established;
    json['phone']=phone;


    return json;

  }
}