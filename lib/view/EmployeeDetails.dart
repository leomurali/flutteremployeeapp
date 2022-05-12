
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/EmployeeModel.dart';


class EmployeeDetails extends StatefulWidget {

  final image;
  final name;
  final username;
  final email;
  final suite;

  final street;
  final city;
  final zipcode;
  final lat;
  final lng;

  final phone;
  final website;
  final companyName;

  EmployeeDetails({
    required this.image,
    required this.name,
    required this.username,
    required this.email,
    required this.suite,
    required this.street,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.website,
    required this.companyName,

  });


  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

enum LegendShape { Circle, Rectangle }

class _EmployeeDetailsState extends State<EmployeeDetails> with TickerProviderStateMixin {

  var image;
  var name;
  var username;
  var email;
  var suite;
  var street;
  var city;
  var zipcode;
  var lat;
  var lng;
  var phone;
  var website;
  var companyName;

  @override
  void initState() {
    super.initState();
    image = widget.image;
    name = widget.name;
    username = widget.username;
    email = widget.email;
    suite = widget.suite;
    street =  widget.street;
    city =  widget.city;
    zipcode =  widget.zipcode;
    lat =  widget.lat;
    lng =  widget.lng;
    phone = widget.phone;
    website = widget.website;
    companyName = widget.companyName;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          toolbarHeight: 60,
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Color(0xFF6F828E),
              ), onPressed: () {
              Get.back();
            },
            ),
          ),
          title: const Text("Employee Information",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6F828E))),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                color: Color(0xFFFFFFFF),
                padding: EdgeInsets.fromLTRB(16, 16, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Employee Detail of : $name",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF143D8F))),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color(0XFFE8F1FF), width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.fromLTRB(0, 4, 16, 4),
                                          alignment: Alignment.topCenter,
                                          color: Colors.white,
                                          height: 64,
                                          width: 64,
                                          child: Image.network( "$image",)
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "$companyName",
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 16,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: Color(0XFF666666)),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                            "$username",
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 14,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: Color(0XFF666666)),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                            "$email",
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 14,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                          ),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "name",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                               Text(
                                                "$name",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "Phone Numer",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "$phone",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "Website",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "$website",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "Suite",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "$suite",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "Street",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "$street",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "city",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "$city",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "Zipcode",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "$zipcode",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "Latitude",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "$lat",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "Longitude",
                                                style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.w400,color: Color(0XFF9AAEC7)),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "$lng",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Color(0XFF666666)),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
