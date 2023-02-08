import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:readme/loginpage/utitls.dart';
import 'package:readme/main.dart';
import 'login_page.dart';
import 'package:email_validator/email_validator.dart';
class createacount extends StatefulWidget {
  const createacount({super.key});

  @override
  State<createacount> createState() => _createacountState();
}

class _createacountState extends State<createacount> {
  final emailController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  final passwordController = TextEditingController();
  @override
  void disposed() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/inwardoutwarddooroptical-compressed.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(137, 0, 0, 0), BlendMode.darken),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              "Create Account",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key:formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: size.width * 0.14,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Positioned(
                        left: size.width * 0.57,
                        top: size.height * 0.08,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(Icons.arrow_upward, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child:  TextFormField(
                          controller: emailController,
                          cursorColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          decoration:const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email,
                              size: 26,
                              color: Colors.white,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 68, 59, 59)),
                          ),
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                                  validator: (email)=>
                                  email!=null&&EmailValidator.validate(email)?
                                  'Enter Valid Email':null,
                        ),
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child:  TextFormField(
                          controller: passwordController,
                            cursorColor:Colors.white ,
                            textInputAction: TextInputAction.next,
                          decoration:const InputDecoration(
                            border:InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 26,
                              color: Colors.white,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 68, 59, 59)),
                          ),
                          obscureText: true,
                               autovalidateMode:AutovalidateMode.onUserInteraction,
                                  validator: (value)=>
                                  value!=null&&value.length<6?
                                  'Enter min 6 character':null,
                        ),
                      ),
                      Container(
                        height: size.height * 0.06,
                        width: size.width * 0.8,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: Colors.blueAccent),
                        child: ElevatedButton(
                          onPressed: signup,
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have Account?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage())),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future signup() async {
    final isvalid=formKey.currentState!.validate();
    if(!isvalid) return
 showDialog(
        builder: (BuildContext context) =>
          const  Center(child: CircularProgressIndicator()),
        context: context);
try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );}
    on FirebaseAuthException catch(e)
    {
      print(e);
      
  Utils.showSnackBar(e.message);

    }
  navigatorKey.currentState!.popUntil((route)=>route.isFirst);
}
}