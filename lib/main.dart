import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // for stepper

  // int currentStep = 0;
  // List<Step> myStep = [
  //   Step(
  //     title: Text("Step 1"),
  //     content: Text("Some content for step 1"),
  //     isActive: true,
  //   ),
  //   Step(
  //     title: Text("Step 2"),
  //     content: Text("Some content for step 2"),
  //     isActive: true,
  //   ),
  //   Step(
  //     title: Text("Step 3"),
  //     content: Text("Some content for step 3"),
  //     isActive: true,
  //   ),
  //   Step(
  //     title: Text("Step 4"),
  //     content: Text("Some content for step 4"),
  //     isActive: true,
  //   ),
  // ];

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Util App"),
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.email),
            ),
          ],
        ),
      ),
      // body: Container(
      //   child: Stepper(
      //     steps: myStep,
      //     currentStep: this.currentStep,
      //     type: StepperType.vertical,
      //   ),
      // ),

      body: TabBarView(
        children: <Widget>[
          NewPage("FirstPage"),
          NewPage("SecondPage"),
        ],
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.teal,
        child: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.email),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          print("FAB pressed"),
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;
  NewPage(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(title)),
    );
  }
}

// class MyScaffold extends StatelessWidget {
//   AlertDialog dialog = new AlertDialog(
//     content: Text(
//       "Dialog is up...",
//       style: TextStyle(fontSize: 30.0),
//     ),
//     title: Text("Dialog Box"),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: RaisedButton(
//             child: Text(
//               "Click Me",
//               style: TextStyle(color: Colors.white),
//             ),
//             color: Colors.redAccent,
//             // onPressed: () => Scaffold.of(context).showSnackBar(
//             //   SnackBar(
//             //     content: Text("I'm SnackBar"),
//             //     duration: Duration(seconds: 2),
//             //   ),

//             onPressed: () => showDialog(
//                   context: context,
//                   child: dialog,
//                 )),
//       ),
//     );
//   }
// }
