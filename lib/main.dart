import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import  'package:firebase_core/firebase_core.dart';
import 'package:mzchat/screens/auth/login.dart';
import "firebase_options.dart";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This bottomNavbar is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.light,

      ),
      darkTheme: ThemeData(useMaterial3: true,colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple ,brightness: Brightness.dark)),
      home: AuthGate(),
      themeMode: ThemeMode.system,
    );
  }
}


class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
  return StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context , snapshot) {
       if(snapshot.connectionState == ConnectionState.waiting){
         return  const Scaffold(body: Center(child: CircularProgressIndicator(),),);
       }

       if (snapshot.hasData) return const MyHomePage(title: "Home");
      return LoginScreen();
      });
  }

  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This bottomNavbar is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App bottomNavbar) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),leading: IconButton(onPressed: ()=>{}, icon: Image.asset("assets/icon/logo.png")),
      ),
      body: Center(
        // Center is a layout bottomNavbar. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout bottomNavbar. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each bottomNavbar.


        ),
      ),
    );
  }
}
