import 'package:database_demo/model/company.dart';
import 'package:database_demo/services/firebase_db_services.dart';
import 'package:flutter/material.dart';

class AddCompany extends StatefulWidget {
  final Company? company;
  const AddCompany({super.key,this.company});

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  TextEditingController _nameController = TextEditingController();
  
  TextEditingController _addressController = TextEditingController();
  
  TextEditingController _phoneController=TextEditingController();
  TextEditingController _establishedController=TextEditingController();
  TextEditingController _servicesController= TextEditingController();

@override
  void initState() {
    
    super.initState();
    if(widget.company !=null){
      _nameController.text= widget.company!.name ??"no name given";
      _addressController.text = widget.company!.address ?? " no aaddress given";
      _phoneController.text=widget.company!.phone.toString();
      _establishedController.text=widget.company!.established.toString();
      _servicesController.text=widget.company!.services.toString();

    }
  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add company"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter name"
                  ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter address"
                  ),
                           ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter phone"
                  ),
                           ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                controller: _establishedController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter established date"
                  ),
                           ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                controller: _servicesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter services"
                  ),
                           ),
             ),
             widget.company!=null?
             ElevatedButton(onPressed: ()async{
              Company company= Company(
                name: _nameController.text,
                address: _addressController.text,
                phone: int.parse(_phoneController.text),
                
                



              );
              await FirebaseDbServices().companyCollection.add(company);



             }, 
             child:Icon(Icons.add),)
            // Center(
            //   child: ElevatedButton(onPressed: ()=>FirebaseDbServices().addCompany(company: null), child: Text('add  company')),
            // )


            










          ],
        ),
      ),
    );
    
  }
}