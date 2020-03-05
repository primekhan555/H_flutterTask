import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double h;
  double w;
  Widget bodydata() {
    return Container(
        width: w,
        height: h,
        // color: Colors.orange,
        child: Column(children: <Widget>[
          Container(
            // cpntainer for status bar
            height: h / 28,
            width: w,
            // color:Colors.red,
          ),
          Container(
              height: h / 10,
              width: w,
              color: Colors.grey[300],
              child: Row(
                children: <Widget>[
                  Container(
                    width: w / 15,
                    // color: Colors.red
                  ),
                  Container(
                      width: w / 4.8,

                      //  color: Colors.cyan,
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: h / 15,
                              // color: Colors.green,
                              child: Icon(Icons.message)),
                          Container(
                              height: h / 40,
                              //     color: Colors.green,
                              child: Text(
                                'Conversation',
                                style: TextStyle(fontSize: 12),
                              )),
                        ],
                      )),
                  // gps widget
                  Container(
                    width: w / 4.8,
                    // color: Colors.cyan,
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: h / 15,
                            //color: Colors.green,
                            child: Icon(Icons.place)),
                        Container(
                            height: h / 40,
                            //color: Colors.green,
                            child: Text(
                              'Gps',
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: w / 30,
                    // color: Colors.red
                  ),

                  Container(
                    //widget for calender
                    width: w / 4.8,
                    //  color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: h / 15,
                            //color: Colors.green,
                            child: Icon(Icons.calendar_today)),
                        Container(
                            height: h / 40,
                            //color: Colors.green,
                            child: Text(
                              'Calender',
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                    ),
                  ), //widget for challengs
                  Container(
                    width: w / 4.8,
                    // color: Colors.yellow,
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: h / 15,
                            //color: Colors.green,
                            child: Icon(Icons.featured_play_list)),
                        Container(
                            height: h / 40,
                            //color: Colors.,
                            child: Text(
                              'Challenges',
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                    ),
                  ),

                  Container(
                    //container for space
                    width: w / 15,
                    // color: Colors.purple
                  ),
                ],
              )),
          Container(
            //second container widget
            height: h / 1.8,
            width: w,
            // color:Colors.yellowAccent,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: h / 31,
                  left: w / 20,
                  //right: w/,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.play_arrow,
                        color: Colors.grey,
                        size: 30,
                      ),
                      Text('/'),
                      Icon(
                        Icons.pause,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                //position for percentindicator

                Positioned(
                    top: h / 15,
                    left: w / 6,
                    right: w / 6,
                    bottom: h / 5,
                    child: CircularPercentIndicator(
                      radius: 200.0,
                      lineWidth: w / 40.0,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.green[300],
                      percent: 0.8,
                      backgroundColor: Colors.white10,
                      animationDuration: 2000,
                      animation: true,
                      center: new Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 80.0, top: 40.0),
                                child: Text(
                                  'STEPS',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                    )),

                Positioned(
                  //position for top friends
                  top: h / 35,
                  right: w / 20,
                  //right: w/,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.blur_linear,
                        color: Colors.grey,
                        size: 30,
                      ),
                      Text(
                        'Top Friends',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),

                Positioned(
                  top: h / 2.9,
                  left: w / 3,
                  right: w / 3,
                  bottom: h / 6,
                  child: Container(
                    height: h / 21,
                    width: w / 3,
                    decoration: BoxDecoration(
                        color: Colors.yellow[200],
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.grey)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Goal : 3000',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // third widget
            height: h / 5,
            width: w,
            //color:Colors.green,
            child: Column(
              children: <Widget>[
                Container(
                  height: h / 12,
                  width: w,
                  //  color:Colors.red,
                ),
                Container(
                    height: h / 10,
                    width: w,
                    //  color:Colors.green,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: w / 15,
                          // color: Colors.red
                        ),
                        Container(
                            width: w / 4.8,
                            // color: Colors.cyan,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: h / 20,
                                    //color: Colors.green,
                                    child: Icon(
                                      Icons.scatter_plot,
                                      color: Colors.grey,
                                    )),
                                Container(
                                    height: h / 40,
                                    //  color: Colors.red,
                                    child: Text(
                                      '12.41',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    height: h / 40,
                                    //color: Colors.green,
                                    child: Text(
                                      'Miles',
                                      style: TextStyle(fontSize: 12),
                                    )),
                              ],
                            )),
                        // gps widget
                        Container(
                          width: w / 4.8,
                          // color: Colors.cyan,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: h / 20,
                                  //color: Colors.green,
                                  child: Icon(Icons.whatshot,
                                      color: Colors.orange)),
                              Container(
                                  height: h / 40,
                                  //color: Colors.red,
                                  child: Text(
                                    '63.8',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  height: h / 40,
                                  //color: Colors.green,
                                  child: Text(
                                    'KCal',
                                    style: TextStyle(fontSize: 12),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: w / 30,
                          // color: Colors.red
                        ),

                        Container(
                          //widget for calender
                          width: w / 4.8,
                          //  color: Colors.red,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: h / 20,
                                  //color: Colors.green,
                                  child: Icon(Icons.calendar_today,
                                      color: Colors.grey)),
                              Container(
                                  height: h / 40,
                                  //color: Colors.red,
                                  child: Text(
                                    '84.45',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  height: h / 40,
                                  //color: Colors.green,
                                  child: Text(
                                    'BMI',
                                    style: TextStyle(fontSize: 12),
                                  )),
                            ],
                          ),
                        ), //widget for challengs
                        Container(
                          width: w / 4.8,
                          // color: Colors.yellow,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: h / 20,
                                  // color: Colors.white,
                                  child: Icon(Icons.watch_later,
                                      color: Colors.grey)),
                              Container(
                                  height: h / 40,
                                  //color: Colors.red,
                                  child: Text(
                                    '1hr 23m',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  height: h / 40,
                                  //    color: Colors.red,
                                  child: Text(
                                    'Active Time',
                                    style: TextStyle(fontSize: 12),
                                  )),
                            ],
                          ),
                        ),

                        Container(
                          //container for space
                          width: w / 15,
                          // color: Colors.purple
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Container(
              //last widget
              height: h / 10,
              width: w,
              color: Colors.grey[300],
              child: Column(
                children: <Widget>[
                  Container(
                    height: h / 99,
                    width: w,
                    //   color:Colors.red,
                  ),
                  Container(
                      height: h / 12,
                      width: w,
                      //  color:Colors.green,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: w / 21,
                            // color: Colors.white
                          ),
                          Container(
                              width: w / 5.5,
                              //color: Colors.purple,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: h / 20,
                                      //color: Colors.green,
                                      child: Icon(
                                        Icons.account_circle,
                                        size: 30,
                                      )),
                                  Container(
                                      height: h / 45,
                                      //   color: Colors.green,
                                      child: Text(
                                        'Me',
                                        style: TextStyle(fontSize: 12),
                                      )),
                                ],
                              )),
                          // gps widget
                          Container(
                            width: w / 5.5,
                            //color: Colors.cyan,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: h / 20,
                                    //color: Colors.green,
                                    child: Icon(
                                      Icons.equalizer,
                                      size: 30,
                                    )),
                                Container(
                                    height: h / 45,
                                    // color: Colors.green,
                                    child: Text(
                                      'Report',
                                      style: TextStyle(fontSize: 12),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: w / 6,
                            height: h / 45,
                            child: Transform.scale(
                              scale: 3.9,
                              child: Tab(
                                icon: new Image.asset(
                                  'images/leap.png',
                                ),
                              ),
                            ),

                            //   color: Colors.white
                          ),

                          Container(
                            //widget for calender
                            width: w / 5.5,
                            //color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: h / 20,
                                    //color: Colors.green,
                                    child: Icon(
                                      Icons.featured_play_list,
                                      size: 30,
                                    )),
                                Container(
                                    height: h / 45,
                                    //      color: Colors.green,
                                    child: Text(
                                      'Feed',
                                      style: TextStyle(fontSize: 12),
                                    )),
                              ],
                            ),
                          ), //widget for challengs
                          Container(
                            width: w / 5.5,
                            //color: Colors.yellow,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: h / 20,
                                    //color: Colors.green,
                                    child: Icon(
                                      Icons.share,
                                      size: 30,
                                    )),
                                Container(
                                    height: h / 45,
                                    //   color: Colors.green,
                                    child: Text(
                                      'Explore',
                                      style: TextStyle(fontSize: 12),
                                    )),
                              ],
                            ),
                          ),

                          Container(
                            //container for space
                            width: w / 18,

                            //color: Colors.purple
                          ),
                        ],
                      )),
                ],
              ))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(body: bodydata());
  }
}
