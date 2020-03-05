import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertask/firstscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = "";
String storedemail = "";
String language = "";
String gender = "";
String dateOfBirth = "";
String password = "";
//String image;
//Image imagepref;
Future<SharedPreferences> preferences = SharedPreferences.getInstance();


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  getdetailing() async{
    SharedPreferences prefer = await preferences;
    username=prefer.getString('username');
    storedemail=prefer.getString('email');
    language=prefer.getString('language');
    gender=prefer.getString('gender');
    dateOfBirth=prefer.getString('dateOfBirth');

    debugPrint(username);
  }
  
  @override
  void initState() {
    super.initState();
    getusername();
    getdetailing();

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Main Screen'),
          backgroundColor: Colors.black38,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  accountName: Text("${username}"),
                  accountEmail: Text("${storedemail}"),
                  currentAccountPicture: Container(
                    child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).platform == TargetPlatform.iOS
                                ? Colors.blue
                                : Colors.white,
                        child: Text("H")),
                  ),
                ),
              ),
              ListTile(
                title: Text("${gender}"),
              ),
              Divider(),
              ListTile(
                title: Text("${language}"),
              ),
              Divider(),
              ListTile(
                title: Text("${dateOfBirth}"),
              ),
              Divider(),
              ListTile(
                title: Text("Logout"),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('email');
                  prefs.remove('username');
                  prefs.remove('password');
                  prefs.remove('language');
                  prefs.remove('gender');
                  prefs.remove('dateOfBirth');
                  prefs.remove('username2');
                  prefs.remove('password2');
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => FirstScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> getusername() async {
  // we will use it globally because it doesn't pick value for the first time
  SharedPreferences pref = await preferences;
  return pref.getString('username');
}

Future<String> getemail() async {
  SharedPreferences pref = await preferences;
  return pref.getString('email');
}

Future<String> getpassword() async {
  SharedPreferences pref = await preferences;
  return pref.getString('password');
}

Future<String> getlanguage() async {
  SharedPreferences pref = await preferences;
  return pref.getString('language');
}

Future<String> getgender() async {
  SharedPreferences pref = await preferences;
  return pref.getString('gender');
}

Future<String> getDOB() async {
  SharedPreferences pref = await preferences;
  return pref.getString('dateOfBirth');
}

// Future<bool> getbool() async {
//  SharedPreferences pref = await preferences;
//  return pref.getBool('status');
// }

//  Future<String> getimage() async {
//  final SharedPreferences pref = await preferences;
//  return pref.getString('img');
// }
