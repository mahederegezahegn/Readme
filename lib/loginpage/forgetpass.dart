import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:readme/loginpage/utitls.dart';

// import 'package:firebase_auth_forgot_password/utils.dart';
class frgpsw extends StatefulWidget {
  const frgpsw({super.key});

  @override
  State<frgpsw> createState() => _frgpswState();
}

class _frgpswState extends State<frgpsw> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ASD.jpg"),
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
            title: const Text(
              "Forget Password",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 232, 118, 118),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView
          (scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Image.asset("assets/images/icons8-medium-old-480.png",width: 150,),
                      Container(
                        width: size.width * 0.8,
                        child: Text(
                          "Enter your email and we send instruction to reset your password",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: emailController,
                          cursorColor: Colors.white,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && EmailValidator.validate(email)
                                  ? 'Enter Valid Email'
                                  : null,
                          decoration: const InputDecoration(
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
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: size.height * 0.06,
                        width: size.width * 0.8,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.blueAccent),
                        child: ElevatedButton(
                          onPressed: resetpassword,
                          child: const Text(
                            'Send',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future resetpassword() async {
   showDialog(
        builder: (BuildContext context) =>
          const  Center(child: CircularProgressIndicator()),
        context: context);
  try{  await FirebaseAuth.instance
        .sendPasswordResetEmail(
          email: emailController.text.trim());
          Navigator.of(context).popUntil((route) => route.isFirst);
  Utils.showSnackBar("password reset email sent");}
  on FirebaseAuthException catch(e){
    print(e);
    Utils.showSnackBar(e.message);
    Navigator.pop(context);
  }
  }
}
