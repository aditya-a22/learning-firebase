import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database_demo/model/company.dart';

 

class FirebaseDbServices {
 
FirebaseFirestore   db = FirebaseFirestore.instance;
CollectionReference companyCollection= FirebaseFirestore.instance.collection("comapnies");
getAllData()async{
  try{
    var querySnapshot= await companyCollection.get();
    var allDocuments = querySnapshot.docs;
    
    List<Company>allCompanies=[];
    for(var document in allDocuments){
      String id= document.id;
      Map data = document.data()as Map;
      Company newCompany = Company(
        id:id,
        
        name:data['name']??" no name",address:data['address']??"no address given",phone:data['phone']??"no phone given",established:data['established']??"no establihed date given",services: ["services"]);
      allCompanies.add(newCompany);

    }
    return allCompanies;
    
  }

catch(e){
  print("the error is $e");
}


}
deleteCompany(String docid)async{
  await companyCollection.doc(docid).delete().then((value) => print("deleted sucessfully")).onError((error, stackTrace) => print("error is $error and stack is $stackTrace"),);
}
addCompany(Company company)async {

  try {
      await companyCollection.add(
        company.toJson()
      );
      print("Company added successfully");
    } catch (e) {
      print("Error adding company: $e");
    }
  }


  updateCompany(Company company) async {
  try {
    await companyCollection.doc(company.id).update(company.toJson());
    print("Company updated successfully");
  } catch (e) {
    print("Error updating company: $e");
  }
}

 
}
