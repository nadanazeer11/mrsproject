import 'package:flutter/material.dart';
import 'package:mrs_project/config/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  bool _obsecureText=true;
  final _formLogin=GlobalKey<FormState>();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    void _submitLogin(){
      debugPrint("f");

      final isValid=_formLogin.currentState!.validate();
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key:_formLogin,
          child: Column(
            children: [
              Container(
                width: w,
                height: h * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/mrsrb.png"),
                    // fit:BoxFit.fill
                  ),
                ),
              ),
              Container(
                  width: w,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "Welcome Back",style: TextStyle(fontSize: 40,color: AppColorss.darkmainColor)),
                      Text("Sign in to Your Account",style: TextStyle(fontSize: 20,color: Colors.grey)),
                      SizedBox(height: 35,),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 7
                              )
                            ],

                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                              controller:emailController,
                            decoration:InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(
                                    Icons.email,color: AppColorss.darkmainColor),
                                focusedBorder: (OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                )),
                                enabledBorder: (OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                errorBorder:UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                                )

                            ),
                            validator:(value){
                              if(value!.isEmpty || !value.contains("@")){
                                return "Please enter a valid Email address";
                              }
                              else{
                                return null;
                              }

                            }
                          )
                      ),
                      SizedBox(height: 30,),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 7
                              )
                            ],

                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obsecureText,
                            controller:passwordController,
                              validator:(value){
                                if(value!.isEmpty || value.length<7){
                                  return "Password should be at least 7 characters";
                                }
                                else{
                                  return null;
                                }

                              },
                            decoration:InputDecoration(
                                suffix: GestureDetector(onTap: (){
                                  setState(() {
                                    _obsecureText=!_obsecureText;
                                  });
                                },child: Icon(_obsecureText?  Icons.visibility: Icons.visibility_off,color: AppColorss.darkmainColor),),
                                hintText: "Password",
                                prefixIcon: Icon(
                                    Icons.password,color: AppColorss.darkmainColor),
                                focusedBorder: (OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                )),
                                enabledBorder: (OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                )


                            ),
                          )
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(onPressed: (){
                          Navigator.pushNamed(context, '/forgetPassword');
                        }, child:
                        Text("Forgot Your Password?",style: TextStyle(color: Colors.grey),)),
                      )
                    ],
                  )
              ),
              SizedBox(height: 18),
              ElevatedButton(onPressed: (){ _submitLogin();}, child:  Text('Log In'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Color(0xFF005466),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(170, 40)
                  )),
              SizedBox(height: 10,),
              Padding(
                padding:const EdgeInsets.fromLTRB(58, 0, 0, 0),
                child: Row(
                  children: [
                    Text("Already Have An Account?",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 20
                        )),
                    TextButton(onPressed: () {
                      Navigator.pushNamed(context,'/signUp');
                    }, child: Text("Create",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        )
                    )
                    )
                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
