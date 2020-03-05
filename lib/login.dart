import 'package:flutter/material.dart';
import 'package:fluttertask/homecreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

String password2 = '';
String username2 = '';
Future<SharedPreferences> preferences = SharedPreferences.getInstance();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double h;
  double w;
  bool _obscureText = true;
  String _username, _password;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _userController = new TextEditingController();

  getuserdetails() async {
    SharedPreferences pref = await preferences;
    String username11 = pref.getString('username');
    String useremail11 = pref.getString('email');
    String userpass11 = pref.getString('password');
    Fluttertoast.showToast(
        msg: 'hiii ${useremail11}', toastLength: Toast.LENGTH_SHORT);
    if (useremail11 == _userController.text ||
        username11 == _userController.text &&
            userpass11 == _passController.text) {
      debugPrint("done danadan");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (
          context,
        ) =>
                MainScreen()),
      );
    }
    // if (_username == username ||
    //     _username == storedemail && _password == password) {
    //   // Fluttertoast.showToast(msg: 'hiii $_username', toastLength: Toast.LENGTH_SHORT);

    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString('username2', username2);
    //   prefs.setString('password2', password2);
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (
    //       context,
    //     ) =>
    //             MainScreen()),
    //   );
    // }
    else {
      return _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
        'Not Registered yet SignUp please',
        style: TextStyle(color: Colors.red),
      )));
    }
  }

  final formKey = GlobalKey<FormState>();
  Widget layoutWidgets() {
    return ListView(
      children: <Widget>[
        Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black54, Colors.black])),
          child: ListView(
            children: <Widget>[
              Container(
                //for space
                height: h / 5,
                //color: Colors.white,
              ),
              Container(
                //   appbar
                //  color: Colors.red,
                height: h / 15,
                alignment: Alignment.bottomCenter,
                child: Text(
                  'lOGIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: (30),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                //for space
                height: h / 13,
                //color: Colors.white,
              ),
              Padding(
                //username
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  width: w / 1.1,
                  // height: h/13,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        title: TextFormField(
                            controller: _userController,
                            validator: (val) =>
                                val.isEmpty ? 'please type your name' : null,
                            onSaved: (val) => _username = val,
                            decoration: InputDecoration.collapsed(
                                hintText: 'Username or email')),
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
                  // height: h/13,
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
                        controller: _passController,
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
                // color: Colors.red,
                //for space
                height: h / 20,
                //color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: GestureDetector(
                  onTap: () async {
                    final form = formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      getuserdetails();
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
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey, body: Form(key: formKey, child: layoutWidgets())),
    );
  }
}

Future<String> getusernamelgn() async {
  // we will use it globally because it doesn't pick value for the first time
  SharedPreferences pref = await preferences;
  return pref.getString('username2');
}

Future<String> getpasswordlgn() async {
  SharedPreferences pref = await preferences;
  return pref.getString('password2');
}
