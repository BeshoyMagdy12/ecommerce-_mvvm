import 'package:ecco_app/features/home/presentation/controller/home_prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<HomeProvider>(context,listen: false);
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,right: 20,left: 20).w,
        child: GridView.builder(
          itemCount: prov.cat!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
            ),
            itemBuilder:(ctx,index){
              return Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(0.1),
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 4,
                  //     spreadRadius: 2,
                  //   )
                  // ],
                  borderRadius: BorderRadius.circular(18).w,
                ),
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
                child: Column(
                  children:
                  [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18).w,
                          child: Image.network(prov.cat![index].url!,fit: BoxFit.cover,width: double.infinity,)),
                    ),
                    const SizedBox(height: 20,),
                    Text(prov.cat![index]!.name.toString())
                  ],
                ),
              );

            },
        ),
      ),
    );
  }
}
