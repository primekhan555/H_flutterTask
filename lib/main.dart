import 'package:flutter/material.dart';
import 'package:fluttertask/firstscreen.dart';
import 'package:fluttertask/homecreen.dart';
import 'package:fluttertask/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //bool checkval= prefs.containsKey('username') && prefs.containsKey('email');

  await getusername().then((value) {
    username = value;
    Fluttertoast.showToast(
        msg: 'hiii $username', toastLength: Toast.LENGTH_SHORT);
    print("value is $value");
  }).catchError((e) {
    print("error is $e");
  }).whenComplete(() {
    print("Successfull");
  });
  await getpassword().then((value) {
    password = value;
    print("value is $value");
  }).catchError((e) {
    print("error is $e");
  }).whenComplete(() {
    print("Successfull");
  });
  await getemail().then((value) {
    storedemail = value;
    //Fluttertoast.showToast(msg: 'hiii $storedemail', toastLength: Toast.LENGTH_SHORT);
    print("value is $value");
  }).catchError((e) {
    print("error is $e");
  }).whenComplete(() {
    print("Successfull");
  });

  await getlanguage().then((value) {
    language = value;
    //Fluttertoast.showToast(msg: 'hiii $language', toastLength: Toast.LENGTH_SHORT);
    print("value is $value");
  }).catchError((e) {
    print("error is $e");
  }).whenComplete(() {
    print("Successfull");
  });
  await getgender().then((value) {
    gender = value;
    //Fluttertoast.showToast(msg: 'hiii $gender', toastLength: Toast.LENGTH_SHORT);
    print("value is $value");
  }).catchError((e) {
    print("error is $e");
  }).whenComplete(() {
    print("Successfull");
  });
  await getDOB().then((value) {
    dateOfBirth = value;
    //Fluttertoast.showToast(msg: 'hiii $dateOfBirth', toastLength: Toast.LENGTH_SHORT);
    print("value is $value");
  }).catchError((e) {
    print("error is $e");
  }).whenComplete(() {
    print("Successfull");
  });

  await getpasswordlgn().then((value) {
    password2 = value;
    Fluttertoast.showToast(
        msg: 'hiii $password2', toastLength: Toast.LENGTH_SHORT);
    print("value is $value");
  }).catchError((e) {
    print("error is $e");
  }).whenComplete(() {
    print("Successfull");
  });

  await getusernamelgn().then((value) {
    username2 = value;
    // Fluttertoast.showToast(msg: 'hiii from main $username2', toastLength: Toast.LENGTH_SHORT);
    print("value is $value");
  }).catchError((e) {
    print("error is $e");
  }).whenComplete(() {
    print("Successfull");
  });

//  await getimage().then((value)
//     {
//        image = value;
//        if(null == image){
//          return null;}else{
//            imagepref=Utility.imageFromBase64String(image);
//          }
//  Fluttertoast.showToast(msg: 'hiii $imagepref', toastLength: Toast.LENGTH_SHORT);
//       print("value is $value");
//     }).catchError((e){
//       print("error is $e");
//     }).whenComplete((){
//       print("Successfull");
//     });
  runApp(MaterialApp(
      home: await getusername() == null //&& storedemail == null
          ? FirstScreen()
          : MainScreen()));
}
