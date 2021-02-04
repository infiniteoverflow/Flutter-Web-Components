import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      home: LandingPage(),
    );
  }
}

TextEditingController phoneNumber = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxHeight > constraints.maxWidth) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LandingPageDetails(mobileView: true,),

                    LandingPageAuthSection()
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: LandingPageDetails(),
                  ),

                  Expanded(
                    flex: 1,
                    child: LandingPageAuthSection(),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class LandingPageDetails extends StatelessWidget {

  bool mobileView;
  LandingPageDetails({
    Key key,
    this.mobileView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (mobileView == false)? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height/1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 15.0),
            child: Text(
              "GROCERY KART",
              style: GoogleFonts.cabin(
                fontSize: 25,
                color: Colors.green,
                fontWeight: FontWeight.bold
              )
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.fjallaOne(
                    fontSize: 25,
                    color: Colors.black,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.w200
                  ),
                ),

                SizedBox(
                  height:20
                ),

                Container(
                  width: MediaQuery.of(context).size.width/4,
                  child: Text(
                    "Grocery Kart is an online destination to buy your favourite items. Safer , Secure and Faster way "
                    "to buy your home needs.",
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),

                Image.asset(
                  'assets/landing.png',
                  height: MediaQuery.of(context).size.width/3,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LandingPageAuthSection extends StatefulWidget {
  const LandingPageAuthSection({
    Key key,
  }) : super(key: key);

  @override
  _LandingPageAuthSectionState createState() => _LandingPageAuthSectionState();
}

class _LandingPageAuthSectionState extends State<LandingPageAuthSection> {

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      controller: controller,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: MediaQuery.of(context).size.height- 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff01272f),
              borderRadius: BorderRadius.circular(35)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  width: MediaQuery.of(context).size.width/4 + 50,
                  child: Text(
                    "In order to login to our system , you should enter the Mobile number or Email Address you gave while registering.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                Container(
                  width: MediaQuery.of(context).size.width/4 + 50,
                  child: TextField(
                    controller: phoneNumber,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter mobile number",
                      hintStyle: GoogleFonts.josefinSans(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Text(
                  "OR",
                  style: GoogleFonts.fjallaOne(
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  width: MediaQuery.of(context).size.width/4 + 50,
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Email Address",
                      hintStyle: GoogleFonts.josefinSans(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  width: MediaQuery.of(context).size.width/4 + 50,
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Password",
                      hintStyle: GoogleFonts.josefinSans(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                GestureDetector(
                  onTap: () {
                    
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/4 + 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal
                    ),
                    child: Center(
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),

                Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical:40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),

                      SizedBox(height: 10,),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.animateTo(
                              MediaQuery.of(context).size.height + 40,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                            );
                          });
                        },
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
        ),

        SizedBox(height: 40,),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height -100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff01272f),
              borderRadius: BorderRadius.circular(35)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:40), 

                Text(
                  "Already have an account ?",
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    controller.animateTo(
                      0,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInCirc
                    );
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Spacer(),

                Text(
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 30,),

                Container(
                  width: MediaQuery.of(context).size.width/4 + 50,
                  child: TextField(
                    controller: phoneNumber,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter mobile number",
                      hintStyle: GoogleFonts.josefinSans(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Text(
                  "OR",
                  style: GoogleFonts.fjallaOne(
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  width: MediaQuery.of(context).size.width/4 + 50,
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Email Address",
                      hintStyle: GoogleFonts.josefinSans(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  width: MediaQuery.of(context).size.width/4 + 50,
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Password",
                      hintStyle: GoogleFonts.josefinSans(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                GestureDetector(
                  onTap: () {
                    
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/4 + 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal
                    ),
                    child: Center(
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),

                Spacer(),

              ],
            )
          ),
        ),
      ],
    );
  }
}