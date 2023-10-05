import 'package:ecco_app/core/utilities/AppRouter.dart';
import 'package:ecco_app/core/utilities/response.dart';
import 'package:ecco_app/features/login/presentation/view_model/prov_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/sherrd_widget/custom_text_form_faild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

 static final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Material(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: Consumer<ProvLogin>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login",style: TextStyle(fontSize: 40.sp,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 50,),
                        CustomTextFormField(
                          controller: provider.textEditingControllerEmail,
                          prefixIcon:const Icon(Icons.email_outlined),
                          keyboardType: TextInputType.emailAddress,
                          hintText: "enter your email",
                          validator: (p0) {
                            if (p0!.isEmpty){
                              return "email is required";
                            }
                          },
                        ),
                        CustomTextFormField(
                          obscureText: provider.obscureText,
                          controller: provider.textEditingControllerPassword,
                          prefixIcon:const Icon(Icons.password),
                          suffixIcon: IconButton(
                            onPressed: provider.vsisbillPassword,
                            icon: Icon(provider.obscureText==true?Icons.visibility_off:Icons.visibility,),),
                          keyboardType: TextInputType.text,
                          hintText: "enter your password",
                          validator: (p0) {
                            if(p0!.isEmpty){
                              return "password is required";
                            }else if(p0.length<8){
                              return "The password must be greater than or equal to 8 characters";
                            }
                          },
                        ),
                        const SizedBox(height: 30,),
                        Center(
                          child: MaterialButton(
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                provider.login(
                                    email:provider.textEditingControllerEmail.text ,
                                    paswword:provider.textEditingControllerPassword.text ,
                                );
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: EdgeInsets.all(20).w,
                                      // Customize your bottom sheet content here
                                      child: Text(
                                        provider.message,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(fontSize: 24.0),
                                      ),
                                    );
                                  },
                                );                            }
                              },
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8).w),
                            padding: EdgeInsets.symmetric(horizontal: 130,vertical: 8).w,
                            textColor: Colors.white,
                            color: Colors.deepOrange,
                            child: Text("Login",style: TextStyle(fontSize: 20.sp),),
                          ),
                        ),
                     const   SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          const  Text("You don't have account ?"),
                            TextButton(onPressed: (){
                              Navigator.pushReplacementNamed(context, AppRouter.register_screen);
                            },
                                child:Text("Register",
                                  style: TextStyle(fontSize: 15.sp,color: Colors.deepOrange,
                                  ),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// void _showBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: EdgeInsets.all(20).w,
//         // Customize your bottom sheet content here
//         child: Text(
//           'This is a Bottom Sheet!',
//           style: TextStyle(fontSize: 24.0),
//         ),
//       );
//     },
//   );
// }
//
//
