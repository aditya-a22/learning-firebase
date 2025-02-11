import 'package:database_demo/model/company.dart';

import 'package:database_demo/services/firebase_db_services.dart';
import 'package:flutter/material.dart';
class CompanyHome extends StatelessWidget {
  const CompanyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("company home"),
      ),
      body: FutureBuilder(future: FirebaseDbServices().getAllData(), builder: (context,snapshot){
        if(snapshot.hasError){
          return Center(
            child: Text("error"),
          );
         }
         if(snapshot.hasData){
          List<Company>allCompanies=snapshot.data as List<Company>;
          return ListView.builder(
            itemCount: allCompanies.length,
            
            itemBuilder: (context,index){
            return ListTile(
              title: Text(allCompanies[index].name!),
              subtitle: Text(allCompanies[index].address!),
              leading: PopupMenuButton(
                onSelected: (value)async{
                  if(value=="edit"){

                  }else{
                    await FirebaseDbServices().deleteCompany(allCompanies[index].id!);
                  }
                },

                
                
                
                
                itemBuilder: (context){
                return[
                  PopupMenuItem(child: Text("edit"),
                  value: "edit"),
                  PopupMenuItem(child: Text("delete"),
                  value: "delete"),
                



                ];
              })
            );
          }
          );
         }
         else{
          return Center(child: CircularProgressIndicator(),);
         }
      }),
    );
  }
}