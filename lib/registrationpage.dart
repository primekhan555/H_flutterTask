import 'package:flutter/material.dart';
import 'package:fluttertask/homecreen.dart';
import 'package:fluttertask/homepage.dart';
import 'package:fluttertask/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> preferences = SharedPreferences.getInstance();

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
  static const String spKey = 'myBool';
}

class _RegistrationState extends State<Registration> {
  bool _testValue;

  //DateTime selectedDate = DateTime.now();
  TextEditingController _usercontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  //String language;

  double h;
  double w;
  Future<File> fileImage;
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _email, _password, _username;
  String dateOfBirth = "Date of Birth";
  String languagestring = "";
  String genderstring = "";
  //bool loginstatus=false;
  //String image="";

  Future<void> showChoiceDialogue(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                    height: h / 3.6,
                    width: w / 46,
                    //  color:Colors.blue,
                    child: Column(
                      children: <Widget>[
                        Container(
                          //  color: Colors.re,
                          alignment: Alignment.center,
                          height: h / 15,
                          width: w / 1.9,
                          child: Text(
                            'Select Your Picture',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: h / 90,
                          // color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            pickImageFromCamera(context);
                            Navigator.of(context).pop();
                            print('hello camera');
                          },
                          child: Container(
                              // for second gallery upload
                              alignment: Alignment.center,
                              height: h / 17,
                              width: w / 1.9,
                              color: Colors.white,
                              child: Text('Take a Picture')),
                        ),
                        Container(
                          height: h / 90,
                          // color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            pickImageFromGallery(context);
                            print('hello gallery');
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              alignment: Alignment.center, // for camera upload
                              height: h / 17,
                              width: w / 1.9,
                              color: Colors.white,
                              child: Text('Upload from Gallery')),
                        ),
                        Container(
                          height: h / 90,
                          //color: Colors.white,
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //    // defaultImage(context);

                        //     print('hello default');
                        //     Navigator.of(context).pop();
                        //   },
                        //   child: Container(
                        //       // for default
                        //       alignment: Alignment.center,
                        //       height: h / 17,
                        //       width: w / 1.9,
                        //       color: Colors.white,
                        //       child: Text('Default Logo')),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> savePrefernces(
      username, email, password, language, gender, dateOfBirth) async {
    SharedPreferences pref = await preferences;
    pref.setString("username", username);
    pref.setString("email", email);
    pref.setString("password", password);
    pref.setString("language", languagestring);
    pref.setString("gender", genderstring);
    pref.setString("dateOfBirth", dateOfBirth);
    // pref.setBool("status", loginstatus);
    //pref.setString("img", image);
  }

  // @override
  // void initState() {
  //   super.initState();

  // //print("stored email is $storedemail");
  //   Fluttertoast.showToast(msg: 'register $storedemail', toastLength: Toast.LENGTH_SHORT);
  // }

  Widget pic() {
    return FutureBuilder<File>(
        future: fileImage,
        builder: (BuildContext context, AsyncSnapshot<File> s) {
          if (s.data != null && s.connectionState == ConnectionState.done) {
            // Utility.base64String(s.data.readAsBytesSync());
            return Image.file(s.data, height: h / 8, width: w / 9);
          } else if (s.error != null) {
            return Text('error');
          } else {
            return Icon(Icons.portrait);
          }
        });
  }

  // defaultImage(BuildContext context) {
  //   this.setState(() {
  //     var picture= NetworkImage('images/default.png');

  //     var picture= Image(image: AssetImage('images/default.png'));
  //     setState(() {
  //        fileImage=picture;
  //     });

  //   });
  // }

  pickImageFromGallery(BuildContext context) {
    var picture = ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      fileImage = picture;
    });
  }

  pickImageFromCamera(BuildContext context) {
    var picture = ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      fileImage = picture;
    });
  }

  double languageheight = 0.0;
  double genderheight = 0.0;
  bool languagebool = false;
  bool genderbool = false;

  Future<Null> _selectDate(BuildContext context) async {
    DatePicker.showDatePicker(
      context,
      theme: DatePickerTheme(
        containerHeight: 210.0,
      ),
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime(2022, 12, 31),
      onConfirm: (date) {
        dateOfBirth = '${date.year} - ${date.month} - ${date.day}';
        //Fluttertoast.showToast(msg: 'date is $dateOfBirth', toastLength:Toast.LENGTH_SHORT);
        setState(() {});
      },
      //  currentTime: DateTime.now(), locale: LocaleType.en
    );
  }

  Widget layoutWidgets() {
    return ListView(
      children: <Widget>[
        Container(
          width: w,
          height: h,
          //color: Colors.black45,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black54, Colors.black])),

          child: ListView(
            children: <Widget>[
              //  Container(
              //    height: h/28,
              //    width: w,
              //    color: Colors.blue,
              //  ),
              Container(
                //   appbar
                //color: Colors.red,
                height: h / 10,
                alignment: Alignment.bottomCenter,
                child: Text(
                  'CREATE ACOUNT',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: (22)),
                ),
              ),
              Container(
                //for space
                height: h / 70,
                //color: Colors.white,
              ),

              Padding(
                //username
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  width: w / 1.1,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        title: TextFormField(
                            controller: _usercontroller,
                            validator: (val) =>
                                val.isEmpty ? 'please type your name' : null,
                            onSaved: (val) => _username = val,
                            decoration: InputDecoration.collapsed(
                                hintText: 'Username')),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                //for spaceK
                height: h / 70,
                //color: Colors.white,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  width: w / 1.1,
                  // height: h / 14,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                        title: TextFormField(
                            controller: _emailcontroller,
                            validator: (val) =>
                                !val.contains('@') ? 'invalid email' : null,
                            onSaved: (val) => _email = val,
                            decoration:
                                InputDecoration.collapsed(hintText: 'Email')),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                //for space
                height: h / 70,
                //color: Colors.white,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  width: w / 1.1,
                  color: Colors.white,
                  child: ListTile(
                      leading: const Icon(
                        Icons.vpn_key,
                        color: Colors.black,
                      ),
                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: new Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      title: TextFormField(
                        controller: _passwordcontroller,
                        obscureText: _obscureText,
                        validator: (val) =>
                            val.length < 6 ? 'password too short' : null,
                        onSaved: (val) => _password = val,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      )),
                ),
              ),
              Container(
                width: w / 22,
                //  color: Colors.orange
              ),

              Container(
                //for space
                height: h / 70,
                //color: Colors.white,
              ),

              Padding(
                // for language
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  //4th text field
                  color: Colors.white,
                  width: w / 1.1,
                  height: h / 14 + languageheight,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(
                          Icons.g_translate,
                          color: Colors.black,
                        ),
                        title: languagestring == ""
                            ? Text("Select Language")
                            : Text(
                                "$languagestring",
                              ),
                        trailing: InkWell(
                          onTap: () {
                            languagebool = !languagebool;
                            if (languagebool) {
                              languageheight = h / 3;
                            } else {
                              languageheight = 0;
                            }
                            setState(() {});
                            print("language height is $languageheight");
                          },
                          child: languagebool == false
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  size: 50,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.arrow_drop_up,
                                  size: 50,
                                  color: Colors.black,
                                ),
                        ),
                        // title:
                        // subtitle: Text('hello'),
                      ),
                      languagebool == true
                          ? Column(
                              children: <Widget>[
                                Container(
                                  //for line
                                  height: h / h,
                                  width: w / 1.3,
                                  color: Colors.black,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      languageheight = 0;
                                      languagebool = false;
                                      languagestring = 'French';
                                    });
                                  },
                                  child: Container(
                                    height: h / 18,
                                    // color: Colors.yellow,
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text('French'),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      languageheight = 0;
                                      languagebool = false;
                                      languagestring = 'Spanish';
                                    });
                                  },
                                  child: Container(
                                    height: h / 18,
                                    //color: Colors.yellow,
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Spanish'),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      languageheight = 0;
                                      languagebool = false;
                                      languagestring = 'English';
                                    });
                                  },
                                  child: Container(
                                      height: h / 18,
                                      //  color: Colors.pink,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text('English')),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      languageheight = 0;
                                      languagebool = false;
                                      languagestring = 'Spanish';
                                    });
                                  },
                                  child: Container(
                                    height: h / 18,
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Russian'),
                                    //color: Colors.green,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      languageheight = 0;
                                      languagebool = false;
                                      languagestring = 'Arabic';
                                    });
                                  },
                                  child: Container(
                                    height: h / 18,
                                    //color: Colors.orange,
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Arabic'),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      languageheight = 0;
                                      languagebool = false;
                                      languagestring = 'chinese';
                                    });
                                  },
                                  child: Container(
                                    height: h / 18,
                                    // color: Colors.redAccent,
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Chinese'),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),

              Container(
                //for space
                height: h / 70,
                //color: Colors.white,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  //4th text field
                  color: Colors.white,
                  width: w / 1.1,
                  height: h / 14 + genderheight,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(
                          Icons.all_out,
                          color: Colors.black,
                        ),
                        title: genderstring == ""
                            ? Text("Gender")
                            : Text("$genderstring"),
                        trailing: InkWell(
                          onTap: () {
                            genderbool = !genderbool;
                            if (genderbool) {
                              // if gender bool is true then expand else height 0

                              genderheight = h / 9.3;
                            } else {
                              genderheight = 0;
                            }
                            setState(() {});
                            print("language height is $genderheight");
                          },
                          child: genderbool == false // for icon toggling

                              ? Icon(
                                  Icons.arrow_drop_down,
                                  size: 50,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.arrow_drop_up,
                                  size: 50,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                      if (genderbool == true)
                        Column(
                          children: <Widget>[
                            Container(
                              height: h / h, //for line between the the dropdown
                              width: w / 1.3,
                              color: Colors.black,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  genderheight = 0;
                                  genderbool = false;
                                  genderstring = 'Male';
                                });
                              },
                              child: Container(
                                // for dropdown
                                height: h / 18,
                                // color: Colors.yellow,
                                padding: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text('Male'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  genderheight = 0;
                                  genderbool = false;
                                  genderstring = 'Female';
                                });
                              },
                              child: Container(
                                height: h / 18,
                                padding: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text('Female'),
                                //color: Colors.red,
                              ),
                            ),
                          ],
                        )
                      else
                        Container(),
                    ],
                  ),
                ),
              ),

              Container(
                //for space
                height: h / 70,
                //color: Colors.white,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                    width: w / 1.1,
                    // height: h / 14,
                    color: Colors.white,
                    // alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            leading: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            onTap: () => _selectDate(context),
                            title: Text('$dateOfBirth')),
                      ],
                    )),
              ),

              Container(
                //for space
                height: h / 70,
                // color: Colors.white,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  width: w / 1.1,
                  height: h / 14,
                  color: Colors.white,
                  child: ListTile(
                    leading: const Icon(
                      Icons.photo,
                      color: Colors.black,
                    ),
                    onTap: () {
                      showChoiceDialogue(context);
                      //  FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    title: TextFormField(
                      showCursor: false,
                      readOnly: true,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Profile Picture',
                      ),
                      //  style: TextStyle(color: Colors.black),
                    ),
                    trailing: Container(
                      height: h / 20,
                      width: w / 9,
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.transparent,
                        // foregroundColor: Colors.white,
                        child: pic(),
                      ),
                      decoration: new BoxDecoration(
                        border: new Border.all(
                          width: 2.0,
                          color: Colors.grey[200],
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    onLongPress: null,
                  ),
                ),
              ),

              Container(
                //for space
                height: h / 35,
                //color: Colors.white,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: GestureDetector(
                  onTap: () {
                    final form = formKey.currentState;
                    if (form.validate()) {
                      form.save();

                      savePrefernces(
                          _usercontroller.text,
                          _emailcontroller.text,
                          _passwordcontroller.text,
                          language,
                          gender,
                          dateOfBirth);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (
                          context,
                        ) =>
                                LoginPage()
                                // MainScreen()
                                ),
                      );
                    }
                  },
                  child: Container(
                    width: w / 1.5,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Colors.tealAccent[100],
                          Colors.lightBlue[100]
                        ])),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(20.0),
                          child: Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: (13)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Container(
              //   //scolor: Colors.blue,
              //   height: h / 5,
              // )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(body: Form(key: formKey, child: layoutWidgets())),
    );
  }
}
