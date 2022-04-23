// import 'dart:js';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:online_shop/constants.dart';
// import 'package:online_shop/models/home_app.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Shop Demo',
// //       theme: ThemeData(
// //         textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: HomeScreen(),
// //     );
// //   }
// // }
// import 'package:flutter/cupertino.dart';
//
// import 'homepage.dart';
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   //
//   Future<FirebaseApp> _initializeFirebase() async{
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//     return firebaseApp;
//   }
//
//
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(body: FutureBuilder(
//       future: _initializeFirebase(),
//       builder: (context, snapshot){
//         if(snapshot.connectionState == ConnectionState.done) {
//           return LoginScreen();
//         }
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     ));
//   }
// }
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   // Login function
//   static Future<User?> loginUsingEmailAndPassword({required String email, required String password, required BuildContext context}) async{
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try{
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password,);
//       user = userCredential.user;
//
//     }on FirebaseException catch(e){
//
//     }
//     return user;
//   }
//
//
//
//   @override
//   Widget build(BuildContext context){
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Mini Shop",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 28.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Text(
//             "Sign in to the Application",
//             style: TextStyle(
//               color: Colors.green,
//               fontSize: 44.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 44.0,
//           ),
//           TextField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//               hintText: "User Email",
//               prefixIcon: Icon(Icons.mail, color: Colors.black54,),
//             ),
//           ),
//           const SizedBox(
//             height: 26.0,
//           ),
//           TextField(
//             controller: _passwordController,
//             obscureText: true,
//             decoration: const InputDecoration(
//                 hintText: "User Password",
//                 prefixIcon: Icon(Icons.security, color: Colors.black54,)
//             ),
//           ),
//           const SizedBox(height: 8.0,),
//           const Text(
//             "Don't remember your password?",
//             style: TextStyle(
//               color: Colors.blueGrey,
//             ),
//           ),
//           const SizedBox(height: 88.0),
//           Container(
//             width: double.infinity,
//             child: RawMaterialButton(
//               fillColor: Colors.lightBlue,
//               elevation: 0.0,
//               padding: EdgeInsets.symmetric(vertical: 20.0),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0)
//               ),
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Home()));
//               },
//               child: const Text(
//                 "Login",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//
//                 ),
//               ),),
//           ),
//         ],
//       ), );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen/bloc/page_bloc.dart';
import 'Screen/login_screen.dart';
import 'constants.dart';
import 'login.dart';
import 'package:online_shop/get_it.dart' as di;
// void main(){
//   runApp( const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: SignInScreen(),
//   ));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
          GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        // home: MainScreen(),
        home: FutureBuilder<Widget>(
          initialData: SignInScreen(),
          future: checkWhetherUserHaveJwtToken(),
          builder: (context, snapshot) {
            return snapshot.data!;
          },
        ),
      ),
    );
  }

  Future<Widget> checkWhetherUserHaveJwtToken() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      return SignInScreen();
    } else {
      return SignInScreen();
    }
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PageBloc>().add(ChangePageEvent(index: 0));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          ResponsiveWidget(
            mobile: mobileWidget(),
            tablet: tabletWidget(),
            desktop: Container(
              height: 753.59,
              child: Row(
                children: [
                  Expanded(
                    flex: (width < 1200) ? 2 : 1,
                    child: SignInScreen(),
                  ),
                  Expanded(
                    flex: (width < 1200) ? 7 : 5,
                    child: BlocBuilder<PageBloc, PageState>(
                      builder: (context, state) {
                        if (state is PageLoaded) {
                          return state.page;
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileWidget() {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is PageLoaded) {
          return state.page;
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget tabletWidget() {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is PageLoaded) {
          return state.page;
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const ActionButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              text,
              style: normalText.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
