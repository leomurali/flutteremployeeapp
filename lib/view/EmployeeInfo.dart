import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_employee_app/controller/Urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_employee_app/models/EmployeeModel.dart';

import 'EmployeeDetails.dart';

void main() => runApp(EmployeeInfo());

class EmployeeInfo extends StatefulWidget {
  @override
  _EmployeeInfoState createState() => _EmployeeInfoState();
}

class _EmployeeInfoState extends State<EmployeeInfo> {
  late Future<List<EmployeeModel>> employeeModel;
  final searchview = TextEditingController();
  late List<EmployeeModel> filteredList;

  @override
  void initState() {
    super.initState();
    employeeModel = getHttpStudentInfo();
  }

  void runFilter(String enteredKeyword) {
    setState(() {
     // filteredList = employeeModel.where((text) => text.name.toString().toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Information',
      theme: ThemeData(
        primaryColor: Colors.black12,
      ),
      home: Scaffold(

        appBar: AppBar(
          titleSpacing: 10,
          toolbarHeight: 60,
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
                color: Color(0xFF6F828E),
              ), onPressed: () {  },
            ),
          ),
          title: const Text("Dashboard",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6F828E))),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Color(0xFFFFFFFF),
              padding: EdgeInsets.fromLTRB(16, 16, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Student Details",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF143D8F))),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              color: Color(0xFFF9FAFC),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Color(0xFFF9FAFC),
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: TextField(
                      controller: searchview,
                      maxLines: 1,
                      cursorHeight: 20,
                      cursorColor: Color(0xFF3B3B3B),
                      onChanged: (value) {
                        setState(() {
                          runFilter(value);
                        });
                      },
                      style: TextStyle(fontSize: 14, color: Color(0xFF3B3B3B), fontWeight: FontWeight.w500, fontFamily: 'OpenSans'),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        filled: true,
                        fillColor: Color(0XFFFFFFFF),
                        enabledBorder:
                        OutlineInputBorder(borderSide: new BorderSide(color: Color(0XFFE8F1FF)), borderRadius: BorderRadius.circular(6)),
                        focusedBorder:
                        OutlineInputBorder(borderSide: new BorderSide(color: Color(0XFFE8F1FF)), borderRadius: BorderRadius.circular(6)),
                        hintText: 'Search Student Name',
                        suffixIcon: const Icon(Icons.search, size: 24, color: Colors.black38,),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(child: FutureBuilder<List<EmployeeModel>>(
              future: employeeModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>

                        GestureDetector(
                          onTap: (){

                            var image = snapshot.data![index].profileImage;
                            var name = snapshot.data![index].name;
                            var username = snapshot.data![index].username;
                            var email = snapshot.data![index].email;
                            var suite = snapshot.data![index].address?.suite;
                            var street = snapshot.data![index].address?.street;
                            var city = snapshot.data![index].address?.city;
                            var zipcode = snapshot.data![index].address?.zipcode;
                            var lat = snapshot.data![index].address?.geo?.lat;
                            var lng = snapshot.data![index].address?.geo?.lng;
                            var phone = snapshot.data![index].phone;
                            var website = snapshot.data![index].website;
                            var companyName = snapshot.data![index].company?.name;

                             Get.to(EmployeeDetails(image: image, name: name, username: username, email: email,
                                 suite: suite,street: street,city: city,  zipcode: zipcode,  lat: lat, lng: lng,  phone: phone,  website: website, companyName: companyName ));
                             print("image - $image");
                            print("name - $name");
                            print("username - $username");
                            print("email - $email");
                            print("suite - $suite");
                            print("street - $street");
                            print("city - $city");
                            print("zipcode - $zipcode");
                            print("lat - $lat");
                            print("lng - $lng");
                            print("phone - $phone");
                            print("website - $website");
                            print("companyName - $companyName");
                             },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color(0XFFE8F1FF), width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(6, 4, 4, 4),
                                    alignment: Alignment.topCenter,
                                    color: Colors.white,
                                    height: 64,
                                    width: 64,
                                    child: Image.network( "${snapshot.data![index].profileImage}",)
                                ),
                                Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${snapshot.data![index].name}",
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'OpenSans',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF143D8F))
                                          ),
                                          SizedBox(height: 5),
                                          Text("${snapshot.data![index].username}",
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'OpenSans',
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF6F828E)))
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),


                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),),

            SizedBox(height: 24,),
          ],
        )

      ),
    );
  }
  Future<List<EmployeeModel>> getHttpStudentInfo() async {
    final response = await http.get(Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<EmployeeModel>((json) => EmployeeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }


}