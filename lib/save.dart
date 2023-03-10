// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'My app',
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//       ),
//       home: const MyHomePage(title: 'Cookie Clicker'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     @override
//     Widget build(BuildContext context) {
//       // This method is rerun every time setState is called, for instance as done
//       // by the _incrementCounter method above.
//       //
//       // The Flutter framework has been optimized to make rerunning build methods
//       // fast, so that you can just rebuild anything that needs updating rather
//       // than having to individually change instances of widgets.
//       return Scaffold(
//         appBar: AppBar(
//           // Here we take the value from the MyHomePage object that was created by
//           // the App.build method, and use it to set our appbar title.
//           title: Text(widget.title),
//         ),
//         body: Center(
//             // Center is a layout widget. It takes a single child and positions it
//             // in the middle of the parent.
//             child: Column(
//               // Column is also a layout widget. It takes a list of children and
//               // arranges them vertically. By default, it sizes itself to fit its
//               // children horizontally, and tries to be as tall as its parent.
//               //
//               // Invoke "debug painting" (press "p" in the console, choose the
//               // "Toggle Debug Paint" action from the Flutter Inspector in Android
//               // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//               // to see the wireframe for each widget.
//               //
//               // Column has various properties to control how it sizes itself and
//               // how it positions its children. Here we use mainAxisAlignment to
//               // center the children vertically; the main axis here is the vertical
//               // axis because Columns are vertical (the cross axis would be
//               // horizontal).
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 InkWell(
//                   onTap: _incrementCounter, // Image tapped
//                   splashColor: Colors.white70, // Splash color over image
//                   child: Image.network(
//                       'https://assets.stickpng.com/images/580b57fbd9996e24bc43c0fc.png'),
//                 ),
//                 Text(
//                   '$_counter',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               ],
//             ),
//             _widgetOptions.elementAt(_selectedIndex)),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.business),
//               label: 'Business',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.school),
//               label: 'School',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.amber[800],
//           onTap: _onItemTapped,
//         ),
//       );
//     }
//   }
// }
