
import 'package:flutter/material.dart';
import 'login.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img_3.png',
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Opacity(
            opacity: 0.4,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                color: Colors.brown,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, left: 118, right: 50),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 40,

                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 115, left: 110, right: 50),
          //   child: Text(
          //     "Create an Account its free",
          //     style: TextStyle(
          //         fontSize: 15,
          //
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white),
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 145, left: 40, right: 50),
          //   child: Text(
          //     "Username",
          //     style: TextStyle(
          //         fontSize: 18,
          //
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 135, left: 40, right: 20),
            child: SizedBox(
              width: 314,
              height: 50,
              child: TextFormField(
                controller: _usernameController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.person),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 235, left: 40, right: 50),
          //   child: Text(
          //     "Email",
          //     style: TextStyle(
          //         fontSize: 18,
          //
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 205, left: 40, right: 20),
            child: SizedBox(
              width: 314,
              height: 50,
              child: TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 325, left: 40, right: 50),
          //   child: Text(
          //     "Password",
          //     style: TextStyle(
          //         fontSize: 18,
          //
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 275, left: 40, right: 20),
            child: SizedBox(
              width: 314,
              height: 50,
              child: TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 410, left: 40, right: 50),
          //   child: Text(
          //     "Confirm Password",
          //     style: TextStyle(
          //         fontSize: 18,
          //
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 345, left: 40, right: 20),
            child: SizedBox(
              width: 314,
              height: 50,
              child: TextFormField(
                controller: _confirmPasswordController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.confirmation_number_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 40,
            child: GestureDetector(
              // onTap: _registerUser,
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFF365BE0),
                      Color(0xFF1B6B6E),
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 485, left: 60),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account? ", // Regular text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: const Text(
                      "Login", // Clickable and bold text
                      style: TextStyle(
                        color: Colors.blue, // Color for the clickable text
                        fontWeight: FontWeight.bold, // Make it bold
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
