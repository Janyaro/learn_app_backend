import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontendd/view/Authentication/login_screen.dart';
import 'package:frontendd/view/Components/reusebtn.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const Center(
              child: Text("Register",style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold
              ), ),
            ),
            const SizedBox(height: 25,),
            TextFormField(
              controller: emailController,
              decoration:const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15 , vertical: 8),
                hintText: 'Email Address',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: emailController,
              decoration:const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15 , vertical: 8),
                hintText: 'Password',
                border: OutlineInputBorder()
              ),
            ),
            
            const SizedBox(height: 30,),
            Reusebtn(btnTitle: "Sign Up", ontap: (){}),
           const SizedBox(height: 10,),
            Align(
              alignment: Alignment.topRight,
              child: RichText(text: TextSpan(
                text: "Already have an account \t" ,
                style:const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  // fontWeight: FontWeight.bold
                ),
                children: [
                  TextSpan(
                    text: 'Log In',
                    style: TextStyle(
                      color: Colors.green.shade400,
                      fontSize: 15,
                      ),
                  recognizer: TapGestureRecognizer()..onTap=(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  }
                  )
                ]
              )),
            )
          ],
        ),
      ),
    );
  }
}