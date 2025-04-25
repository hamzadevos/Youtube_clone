//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:youtube/screens/home.dart';
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final _auth = FirebaseAuth.instance;
//
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   late String email;
//   late String password;
//   bool isLoading = false;
//
//   void _login() async {
//     if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
//       setState(() {
//         isLoading = true;
//       });
//
//       email = _emailController.text;
//       password = _passwordController.text;
//
//       try {
//         await _auth.signInWithEmailAndPassword(
//             email: email, password: password);
//
//         // Clear the text fields
//         _emailController.clear();
//         _passwordController.clear();
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Login successful!')),
//         );
//
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (_) => const HomeScreen()));
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login failed: $e')),
//         );
//       } finally {
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Fill each column')));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 0, right: 20),
//                 child: Image.asset("assets/img_4.png"),
//               ),
//             ),
//             SizedBox(
//               width: 300,
//               child: TextField(
//                 onChanged: (value) {
//                   email = value;
//                 },
//                 keyboardType: TextInputType.emailAddress,
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             SizedBox(
//               width: 300,
//               child: TextField(
//                 onChanged: (value) {
//                   password = value;
//                 },
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: isLoading ? null : _login,
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.black,
//               ),
//               child: isLoading
//                   ? const CircularProgressIndicator(
//                 color: Colors.green,
//               )
//                   : const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube/screens/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String email;
  late String password;
  bool isLoading = false;

  void _login() async {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      email = _emailController.text;
      password = _passwordController.text;

      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        // Clear the text fields
        _emailController.clear();
        _passwordController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $e')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fill each column')));
    }
  }

  void _googleLogin() async{

    setState(() {
      isLoading= true;
    });
    try{
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if(googleAuth!= null){
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );

      }

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e'))
      );
    }
    finally{
      setState(() {
        isLoading= false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: 0.4,
            child: Padding(
              padding: const EdgeInsets.only(top: 94),
              child: Container(
                color: Colors.brown[800],
                width: 431,
                height: 900,
                child: const Padding(
                  padding: EdgeInsets.only(top: 55, left: 110, right: 50),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.33,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 52, left: 135),
            child: Text(
              '',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 220, left: 40),
          //   child: Text(
          //     'Email',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 18),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 249, left: 40, right: 20),
            child: SizedBox(
              width: 314,
              height: 50,
              child: TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.email),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,)

                  ),
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 310, left: 40),
          //   child: Text(
          //     'Password',
          //     style: TextStyle(
          //         color: Colors.white, fontSize: 18),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 320, left: 40, right: 20),
            child: SizedBox(
              width: 314,
              height: 50,
              child: TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),

                obscureText: true,
                // Hide password input
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.grey),
                    // icon: Icon(Icons.hide_source),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    suffixIcon: Icon(Icons.key)
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 375, left: 210),
            child: Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Positioned(
            bottom: 135,
            left: 45,
            child: GestureDetector(
                onTap: _login,
              child: Container(
                width: 290,
                height: 50,
                decoration: BoxDecoration(
                    gradient:  LinearGradient(colors: [
                      Color(0xFF365BE0),
                      Color(0xFF1B6B6E),
                    ]),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 45,
            child: GestureDetector(
                onTap: _googleLogin,
              child: Container(
                width: 290,
                height: 50,
                decoration: BoxDecoration(
                   color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                  children:[
                   Image.asset("assets/img_7.png") ,
                   Text(
                    'Login With Google',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  ]
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 535, left: 60),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haven't Registered yet? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
