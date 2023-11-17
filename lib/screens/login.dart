import 'package:flutter/material.dart';
import 'package:food_ape_3/main.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final List<Map<String, String>> data;
  final List<Map<String, String>> data2;

  LoginScreen({required this.data, required this.data2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 200,
                    width: 500,
                    child: RiveAnimation.asset(
                      'assets/rive/login.riv',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Add your details to login',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange[700],
                    fontFamily: 'Roboto',
                  ),
                ),
                Spacer(),
                TextFormField(
                  controller: regNoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.person_2),
                    labelText: 'Registration No.',
                    hintText: 'Enter your Registration No.',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Registration No.';
                    }
                    return null;
                  },
                ),
                Spacer(),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Spacer(),
                ElevatedButton(
                  
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          data2: data2,
                          data: data,
                        ),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    primary: Colors.orange,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/forgetPwScreen');
                  },
                  child: Text("Forget your password?"),
                ),
                Spacer(
                  flex: 2,
                ),
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/signUpScreen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      SizedBox(width: 5),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
