import 'dart:math';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'constants.dart';

class TestClass extends StatelessWidget {
  String? name;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Widget> x =  [
      Positioned(
        top: 0,
        right: 0,
        child: Container(
          alignment: Alignment.center,
          width: min(MediaQuery.of(context).size.width / 2,MediaQuery.of(context).size.height / 2),
          height: min(MediaQuery.of(context).size.width / 2,MediaQuery.of(context).size.height / 2),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(360),
            ),
            boxShadow:[
              BoxShadow(color: Colors.black,
                offset: Offset(5, 5),
                blurRadius: 5.0,
              ),
            ] ,
            gradient: LinearGradient(colors: [
              Colors.blue.shade700,
              Colors.blue.shade900,
            ],
              transform: GradientRotation(-67.5),
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        child: Container(
          alignment: Alignment.center,
          width: min(MediaQuery.of(context).size.width *2/ 3,MediaQuery.of(context).size.height *2/ 3),
          height: min(MediaQuery.of(context).size.width *2/ 3,MediaQuery.of(context).size.height *2/ 3),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(360),
              ),
              boxShadow:[
                BoxShadow(color: Colors.black,
                  offset: Offset(5, 0),
                  blurRadius: 5.0,
                )
              ] ,
              gradient: LinearGradient(colors: [
                Colors.blue.shade400,
                Colors.blue.shade600,
              ],

                transform: GradientRotation(-67.5),
              )
          ),
        ),
      ),
      Positioned(
        bottom: 80,
        right: 35,
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(color: Colors.black,
                offset: Offset(5, 0),
                blurRadius: 5.0,
              )
            ] ,
            gradient: LinearGradient(colors: [
              Colors.blue.shade400,
              Colors.blue.shade600,
            ],),
            borderRadius: BorderRadius.circular(500),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(color: Colors.black,
                offset: Offset(5, 5),
                blurRadius: 5.0,
              ),
            ] ,
            gradient: LinearGradient(colors: [
              Colors.blue.shade700,
              Colors.blue.shade900,
            ],
              transform: GradientRotation(-67.5),
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(120),
            ),
          ),
        ),
      ),];

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              x[0], x[1], x[2], x[3],
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      NeonText(
                        text: "Sign in",
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        textSize: 50.0,
                        spreadColor: Colors.blue.shade900,
                        blurRadius: 60,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          name = val;
                        },
                        decoration: InputDecoration(
                            label: const Text("Email"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          name = val;
                        },
                        decoration: InputDecoration(
                            label: const Text("Password"),

                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 9.0),
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child:
                        NeonText(
                          textAlign: TextAlign.right,
                          textColor: Colors.blue.shade600,
                          text: "Forget Password?",
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          textSize: 14.0,
                          spreadColor: Colors.blue.shade900,
                          blurRadius: 18,
                        ),),
                      ),


                      // TextFormField(
                      //   validator: (value) {
                      //     return value!.isEmpty ? "Enter Password" : null;
                      //   },
                      //   textDirection: TextDirection.ltr,
                      //   textAlign: TextAlign.left,
                      //   maxLines: 1,
                      //   autovalidateMode: AutovalidateMode.disabled,
                      //   cursorErrorColor: Colors.red,
                      //   cursorColor: Colors.white,
                      //   enabled: true,
                      //   scrollPhysics: const BouncingScrollPhysics(),
                      //   controller: passwordController,
                      //   maxLength: 100,
                      //   readOnly: false,
                      //   decoration: InputDecoration(
                      //     hintText: "password",
                      //     icon: const Icon(Icons.key),
                      //     suffixIcon: const Icon(Icons.key),
                      //     iconColor: Colors.red,
                      //     suffixIconColor: Colors.blue,
                      //     filled: true,
                      //     prefixIcon: const Icon(Icons.local_activity),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10)),
                      //     fillColor: Colors.grey.shade600.withOpacity(0.2),
                      //     label: const Text("Password"),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //   ),
                      // ),

                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width/2,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              maximumSize:        MaterialStateProperty.all<Size>(const Size(200, 60)),
                              minimumSize: MaterialStateProperty.all<Size>(const Size(200, 60)),
                              elevation: WidgetStateProperty.all(2.0),
                              fixedSize:
                                  MaterialStateProperty.all<Size>(const Size(60, 60)),
                              shadowColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              iconColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade600),

                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),),
                      ),
                      Center(
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.purple.withOpacity(0),
                          child: Container(
                            width: 200,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade400,
                                  Colors.blue.shade600,
                                ],

                                  transform: GradientRotation(-67.5),
                                ),
                              borderRadius: BorderRadius.circular(200),
                            ),
                              child: Text("Log in")),
                          textColor: Colors.white,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200.0),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 44.0,
                          width: MediaQuery.of(context).size.width/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: kDarkGradiant,),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                            child: Text('Elevated Button'),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

