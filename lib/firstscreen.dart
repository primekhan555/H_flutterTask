import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertask/login.dart';
import 'package:fluttertask/registrationpage.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double h;
  double w;
  //DateTime backbuttonpressedTime;
//DateTime currentBackPressTime;
// Future<bool> onWillPop() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime) > Duration(seconds: 2)) {
//       currentBackPressTime = now;
//       Fluttertoast.showToast(msg: 'exit');
//       return Future.value(false);
//     }
//     return Future.value(true);
//   }

  layoutWidgets() {
    return ListView(
      children: <Widget>[
        Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black54, Colors.black])),
          child: ListView(
            children: <Widget>[
              Container(
                //for space
                height: h / 3,
                //color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );

                    //   savePrefernces(_username, _email, _password);
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
                            'Login',
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
              Container(
                //for space
                height: h / 40,
                //color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registration()),
                    );
                    //   savePrefernces(_username, _email, _password);
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
                            'SignUp',
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

    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: SafeArea(
        child: Scaffold(body: Form(child: layoutWidgets())),
      ),
    );
  }

  // @override
  // void setState(fn) {
  //   super.setState(fn);
  //       if(username!=null && password!=null){
  //    Navigator.push( context, MaterialPageRoute(builder: (context) => MainScreen()),);
  //   }else{
  //        Fluttertoast.showToast(msg: 'hiii me huma', toastLength: Toast.LENGTH_SHORT);

  //   }
  // }

}
