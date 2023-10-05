import 'package:ecco_app/core/utilities/cash_healper.dart';
import 'package:ecco_app/features/home/data/model/ProductModel.dart';
import 'package:ecco_app/features/home/presentation/view/widget/custom_carousel_slider.dart';
import 'package:ecco_app/features/home/presentation/view/widget/custom_list_view_categores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/sherrd_widget/custom_text_form_faild.dart';
import '../controller/home_prov.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 5).w,
            child: CustomTextFormField(
              onChanged: (p0) {
                Provider.of<HomeProvider>(context).filiterProduct(input:p0);
              },
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              suffixIcon: Icon(Icons.close),
            ),
          ),
          const CustomCarouselSlider(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            child: CustomListViewCategores(),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Products",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            child:CustomGridViewItem()
          )
        ],
      ),
    );
  }
}

class CustomGridViewItem extends StatefulWidget {
  const CustomGridViewItem({super.key});

  @override
  State<CustomGridViewItem> createState() => _CustomGridViewItemState();
}

class _CustomGridViewItemState extends State<CustomGridViewItem> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final products = Provider.of<HomeProvider>(context, listen: false);
      await products.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider prov = Provider.of<HomeProvider>(context);
     if(prov.filterProduct!.isNotEmpty){
       return  GridView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemCount: prov.filterProduct!.isEmpty?prov.products!.length:prov.filterProduct!.length,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
               childAspectRatio: 3.2/4
           ),
           itemBuilder: (ctx, idx) {
             print(prov.filterProduct!.length);
             return Container(
               margin:const EdgeInsets.all(10),
               //  height: 280,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: Colors.deepOrange,

               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Expanded(
                     child: Image.network(
                   prov.filterProduct!.isEmpty?    prov.products![idx].image.toString():prov.filterProduct![idx].image.toString(),
                       fit: BoxFit.fill,
                       width: double.infinity,
                       // height: double.infinity,
                     ),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5).w,
                     child: Text(
                       prov.filterProduct!.isEmpty?
                       prov.products![idx].name!:prov.filterProduct![idx].name.toString(),
                       style: const TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 16,
                           overflow: TextOverflow.ellipsis,
                           color: Colors.white
                       ),
                     ),
                   ),
                   const SizedBox(
                     height: 2,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5).w,
                     child: Row(

                       children: [
                         Expanded(
                           child: Row(

                             children: [
                               FittedBox(
                                   fit: BoxFit.scaleDown,
                                   child: Text(
                                     "${        prov.filterProduct!.isEmpty?
                                     prov.products![idx].price!:prov.filterProduct![idx].price.toString()} \$",
                                     style:const TextStyle(fontSize: 13,                    color: Colors.white
                                     ),
                                   )),
                             const  SizedBox(
                                 width: 5,
                               ),
                               FittedBox(
                                 fit: BoxFit.scaleDown,
                                 child: Text(
                                   "${        prov.filterProduct!.isEmpty?
                                   prov.products![idx].oldPrice!:prov.filterProduct![idx].oldPrice.toString()} \$",
                                   style:const TextStyle(
                                     color: Colors.white,
                                     fontSize: 12.5,
                                     decoration: TextDecoration.lineThrough,

                                   ),
                                 ),
                               )
                             ],
                           ),
                         ),
                         GestureDetector(
                           child:const Icon(
                             Icons.favorite,
                             size: 20,
                             color: Colors.white,
                           ),
                           onTap: () {
                             // Add | remove product favorites
                           },
                         )
                       ],
                     ),
                   )
                 ],
               ),
             );
           });
     }else if(prov.products!.isNotEmpty){
       return  GridView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemCount: prov.filterProduct!.isEmpty?prov.products!.length:prov.filterProduct!.length,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
               childAspectRatio: 3.2/4
           ),
           itemBuilder: (ctx, idx) {
             print(CasheHelper.getDataString(key: "token"));
             return Container(
               margin:const EdgeInsets.all(10),
               //  height: 280,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: Colors.deepOrange,

               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Expanded(
                     child: Image.network(
                       prov.products![idx].image.toString(),
                       fit: BoxFit.fill,
                       width: double.infinity,
                       // height: double.infinity,
                     ),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5).w,
                     child: Text(
                       prov.filterProduct!.isEmpty?
                       prov.products![idx].name!:prov.filterProduct![idx].name.toString(),
                       style: const TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 16,
                           overflow: TextOverflow.ellipsis,
                           color: Colors.white
                       ),
                     ),
                   ),
                   const SizedBox(
                     height: 2,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5).w,
                     child: Row(

                       children: [
                         Expanded(
                           child: Row(

                             children: [
                               FittedBox(
                                   fit: BoxFit.scaleDown,
                                   child: Text(
                                     "${        prov.filterProduct!.isEmpty?
                                     prov.products![idx].price!:prov.filterProduct![idx].price.toString()} \$",
                                     style: TextStyle(fontSize: 13,                    color: Colors.white
                                     ),
                                   )),
                               SizedBox(
                                 width: 5,
                               ),
                               FittedBox(
                                 fit: BoxFit.scaleDown,
                                 child: Text(
                                   "${        prov.filterProduct!.isEmpty?
                                   prov.products![idx].oldPrice!:prov.filterProduct![idx].oldPrice.toString()} \$",
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 12.5,
                                     decoration: TextDecoration.lineThrough,

                                   ),
                                 ),
                               )
                             ],
                           ),
                         ),
                         GestureDetector(
                           child: Icon(
                             Icons.favorite,
                             size: 20,
                             color: Colors.white,
                           ),
                           onTap: () {
                             // Add | remove product favorites
                           },
                         )
                       ],
                     ),
                   )
                 ],
               ),
             );
           });
     }else{
       return Center(child: CircularProgressIndicator(color: Colors.deepOrange,),);
     }
  }
}
