import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            child: SafeArea(
              child: Column(
                children: [
                  const Center(
                    child: Text("Groupie", style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Login now to see what they \nare talking about", style:
                    TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                  ),
                  textAlign: TextAlign.center
                  ,),
                  const SizedBox(height: 40,),
                  const Image(image: AssetImage("assets/images/homeimage.png"), height: 250,),
                  const SizedBox(height: 40,),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.deepPurple,),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple, width: 1
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple, width: 1
                        ),
                      ),
                    ),
                    // read value
                    onChanged: (val) {
                      email = val;
                    },

                    // check validation
                    validator: (val) {
                      return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.deepPurple,),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurple, width: 1
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurple, width: 1
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple
                      ),
                        child: const Text(
                          "Login", style: TextStyle(
                          fontSize: 17
                        ),
                        ),
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't you have an account?"),
                      TextButton(onPressed: () {},
                          child: const Text("Register here", style: TextStyle(
                            color: Colors.red
                          ),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
