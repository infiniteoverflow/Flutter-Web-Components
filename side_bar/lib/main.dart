import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List categories = [
    ['all.png','All'],
    ['grocery.png','Grocery'],
    ['vegetable.png','Vegetables'],
    ['fruit.png','Fruits'],
    ['beverage.png','Beverages'],
    ['fish.png','Fish'],
    ['meat.png','Meat'],
    ['household.png','Household'],
    ['pharmacy.png','Pharmacy'],
  ];

  int tabIndex = 0;
  List<Widget> tabs = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<categories.length;i++) {
      tabs.add(
        Center(
          child: Text(
            categories[i][1],
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey
            ),
          ),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kSecondaryColor,
      body: Row(
        children: [
          Container(
            color: Colors.amber.withOpacity(0.6),
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 10),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                FutureBuilder(
                  future: null,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              tabIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/${categories[index][0]}'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  categories[index][1],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: index == tabIndex ? FontWeight.bold : FontWeight.normal
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                )
              ],
            ),
          ),

          Expanded(
            child: Container(
              child: IndexedStack(
                index: tabIndex,
                children: tabs,
              ),
            ),
          )
        ],
      ),
    );
  }
}
