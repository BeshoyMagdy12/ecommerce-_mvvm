import 'package:ecco_app/features/home/presentation/controller/home_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListViewCategores extends StatefulWidget {
  const CustomListViewCategores({super.key});

  @override
  State<CustomListViewCategores> createState() => _CustomListViewCategoresState();
}

class _CustomListViewCategoresState extends State<CustomListViewCategores> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final categores = Provider.of<HomeProvider>(context, listen: false);
      await categores.getCategores();
    });
  }
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeProvider>(context);

    return  context.read<HomeProvider>().cat!.isEmpty? Center(child: const CircularProgressIndicator(color: Colors.deepOrange,)):SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.separated(

          physics: BouncingScrollPhysics(),
          itemCount: context.read<HomeProvider>().cat!.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context,index){
            return SizedBox(width: 15,);
          },
          itemBuilder: (context,index)
          {
            //  print(prov.cat!.length);
            return CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(context.read<HomeProvider>().cat![index].url!),
            );
          }
      ),
    );
  }
}

