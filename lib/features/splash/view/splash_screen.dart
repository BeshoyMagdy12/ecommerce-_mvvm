import 'package:ecco_app/core/utilities/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {





  List<Widget> pages =
List.generate(3, (index) => Center(
  child: Container(
    color: Colors.grey[200],
    alignment: Alignment.center,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("TOKOTO",style:TextStyle(fontSize: 30.sp,color: Colors.deepOrange,fontWeight: FontWeight.bold),
      ),
     const SizedBox(height: 5,),
      Text(index==0?"Welcome to Tokoto, Let’s shop!":(index==1?"We help people conect with store \naround United State of America": "We show the easy way to shop. \nJust stay at home with us"),),
    Padding(
      padding: const EdgeInsets.all(100),
      child: Image.asset(index==0?"assets/splash_1.png":(index==1?"assets/splash_2.png":"assets/splash_3.png"),),
    ),

    //  Image.asset(name)

    ],
  ),
  ),
),
);
  final PageController _pageController = PageController(initialPage: 0);
  bool _skipped = false;
  bool _last=false;



  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                if(value==pages.length-1){
                  setState(() {
                    _last=true;
                  });
                  print("last");
                }else{
                  _last=false;
                  print("no last");

                }
              },
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
              pageSnapping: true, // Enable page snapping behavior
            ),

          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal:10,vertical: 5 ).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _skipped = true;
                      _pageController.jumpToPage(pages.length - 1);
                      Navigator.pushReplacementNamed(context, AppRouter.login_screen);

                    });
                  },
                  child: Text('Skip',style: TextStyle(fontSize: 15.sp),),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(_last==true){
                      Navigator.pushReplacementNamed(context, AppRouter.login_screen);
                    }
                    if (_pageController.page! < pages.length - 1) {
                      _pageController.nextPage(
                        duration:const Duration(milliseconds: 300),
                        curve: Curves.ease,

                      );

                    }
                  },
                  child: Text('Next',style: TextStyle(fontSize: 15.sp),),
                ),
              ],
            ),
          ),
        ],
      ),
    )

    ;
  }
}
