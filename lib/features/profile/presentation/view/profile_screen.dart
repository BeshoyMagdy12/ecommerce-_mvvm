import 'package:ecco_app/core/utilities/AppRouter.dart';
import 'package:ecco_app/core/utilities/cash_healper.dart';
import 'package:ecco_app/features/login/presentation/view/login_screen.dart';
import 'package:ecco_app/features/profile/data/models/profile_model.dart';
import 'package:ecco_app/features/profile/presentation/controller/prov_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}


class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
       final profile = Provider.of<ProvProfile>(context, listen: false);
      profile.getProfile();
    });
  }
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<ProvProfile>(context,listen: false);
    return Material(
      child: Center(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  Spacer(),
            CircleAvatar(
              radius: 65,
              backgroundImage: NetworkImage(prov.img??""),backgroundColor: Colors.deepOrange,
            ),
            Text(prov.name??"is loding ....",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            const  SizedBox(height: 20,),
            Text(prov.email??"",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            const  SizedBox(height: 20,),
            ListTile(
              onTap: (){
                CasheHelper.deleteData(key: "token");
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) =>const LoginScreen(),
                  ),
                      (route) => true, // Predicate to remove all previous routes
                );
              },
              leading: Text("Logout",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
              trailing: Container(

               // padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.8)

                ),
                  child:const Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                  ),
              ),


            ),

            const Spacer(flex: 3),

          ],
        ),
      ),
    );
  }
}
