import 'package:flutter/material.dart';
import 'package:flutter_roadmap/model/login_response.dart';
import 'package:flutter_roadmap/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.

          ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Future<LoginResponse> loginResponse;

  //TextfieldControllers
   final tecUsername = TextEditingController();
   final tecPwd = TextEditingController();

   TextField tfUsername,tfPwd;

   @override
  void initState() {

     // TODO: implement initState
    super.initState();
    
    loginResponse = login("soft.dev13@cbsl-india.com", "ankit", "1.2.3.4");
    loginResponse.then((value) => print("response "+value.toJson().toString()));


    //widgets
    tfUsername = TextField(
      obscureText: false,
      controller: tecUsername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
    );


    tfPwd= TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
    );





   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(Constants.appTitle),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/main_icon.png',
                width: 120,
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Flutter RoadMap Login",
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: tfUsername,
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: tfPwd
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.red)
                ),
                onPressed: () {

                  var email = tecUsername.text;
                  var password = tecPwd.text;

                  loginResponse = login(email, password, "1.2.3.4");

                  loginResponse.then((value) =>
                      print("response "+value.toJson().toString()));

                },
                textColor: Colors.white,
                child: Text(
                  "Login",
                  style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
        ),
    );
  }



   Future<LoginResponse> login(String email , String pwd ,String ip) async {

     var map = new Map<String, dynamic>();
     map['name'] = email;
     map['pwd'] = pwd;
     map['ip'] = ip;

     var params = {
       "name" : email,
       "pwd" : pwd,
       "ip" : ip
     };

     final response = await http.post(ApiUrl.LOGIN_URL,body: params);

     if (response.statusCode == 200) {
       return LoginResponse.fromJson(jsonDecode(response.body));
     } else {
       throw Exception('Failed to load album');
     }
   }

}
