import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:online_shop/models/User.dart';
// import 'package:http/http.dart' as http;
// class Login extends StatefulWidget{
//   const Login({Key? key}) : super(key: key);
//   @override
//   _LoginState createState() => _LoginState();
//
// }
//
// class _LoginState extends State<Login>{
//   late Future<User> futureUser;
//   final _formkey = GlobalKey<FormState>();
//   User user = User("","");
//
//   // Future save() async{
//   //   var res = await http.get(Uri.parse(url) ,
//   //       headers: {'Content-Type': 'application/json'}, body: json.encode({
//   //       'email': user.email,
//   //       'password': user.password}));
//   //   print(res.body);
//   // }
//
//   Future<Exception> fetchUser() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       // return User.fromJson(jsonDecode(response.body));
//       return Exception('Successfully');
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//
//   }
//   @override
//   void initState() {
//     super.initState();
//     // futureUser = fetchUser();
//   }
//     @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(key: _formkey, child: Column(
//           children: [
//             Container(
//               height: 700,
//               width: MediaQuery.of(context).size.width,
//               decoration: const BoxDecoration(
//                 color: Color.fromRGBO(233, 65, 82, 1),
//                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90), bottomRight: Radius.circular(22))
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                 children:[
//                   SizedBox(height: 100,
//                   ),
//                   Text("Login",
//                     style: GoogleFonts.pacifico(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 50,
//                     color: Colors.white,
//                   ),),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text("Email",
//                     style: GoogleFonts.roboto(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                       color: Color.fromRGBO(233, 255, 255, 0.8)
//                     ),),
//                   ),
//                   TextFormField(
//                     controller: TextEditingController(text: user.email),
//                     onChanged: (val){
//                       user.email = val;
//                     },
//
//                     validator: (value){
//                       if(value != null && value.isEmpty){
//                         return 'Value is empty!!';
//                       }else{
//                         return '';
//                       }
//                     },
//                     style: const TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(borderSide: BorderSide.none),
//                     ),
//                   ),
//                   Container(
//                     height: 8,
//                     color: const Color.fromRGBO(255, 255, 255, 0.4),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text("Password",
//                       style: GoogleFonts.roboto(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                           color: Color.fromRGBO(233, 255, 255, 0.8)
//                       ),),
//                   ),
//                   TextFormField(
//                     controller: TextEditingController(text: user.password),
//                     onChanged: (val){
//                       user.password = val;
//                     },
//                     validator: (value){
//                       if(value != null && value.isEmpty){
//                         return 'Password is empty!!';
//                       }else{
//                         return '';
//                       }
//
//                     },
//                     style: const TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(borderSide: BorderSide.none),
//                     ),
//                   ),
//                   Container(
//                     height: 8,
//                     color: const Color.fromRGBO(255, 255, 255, 0.4),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Center(
//                       child: Text(
//                         "Don't have Account?",
//                         style: GoogleFonts.roboto(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ))
//                 ]),
//               ),
//             ),
//             SizedBox(height: 30,),
//             Container(
//               height: 70,
//               width: 70,
//               child: FlatButton(
//                 color: Color.fromRGBO(233, 68, 82, 1),
//                   onPressed: (){
//                   // if(_formkey.currentState.validate()){
//                   //   save();
//                   // }
//                   },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(40)
//                   ),
//                   child: Icon(Icons.arrow_forward, size: 20, color: Colors.white,)),
//             )
//           ],
//         ),
//         ),),
//       );
//   }
// }
