import 'package:chat_app/screens/log_in_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isVisible = false;
  String fullName = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
                    const Text("Register and chat away!!", style:
                    TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    ),
                      textAlign: TextAlign.center
                      ,),
                    const SizedBox(height: 20,),
                    const Image(image: AssetImage("assets/images/groupimage.png"), height: 250,),
                    const SizedBox(height: 20,),
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
                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Full Name",
                        prefixIcon: Icon(Icons.person, color: Colors.deepPurple,),
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
                      validator: (val) {
                        if(val!.isNotEmpty) {
                          return null;
                        } else {
                          return "Name is not empty";
                        }
                      },
                      onChanged: (val) {
                        fullName = val;
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: isVisible ? const Icon(Icons.visibility_off,
                            color: Colors.grey, size: 20,) : const Icon(
                            Icons.visibility, color: Colors.grey, size: 20,),
                        ),
                        prefixIcon: const Icon(Icons.lock, color: Colors.deepPurple,),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple, width: 1
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple, width: 1
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val!.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple
                        ),
                        child: const Text(
                          "Sign Up", style: TextStyle(
                            fontSize: 17
                        ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account?"),
                        TextButton(onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                        },
                            child: const Text("Login here", style: TextStyle(
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
