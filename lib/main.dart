import 'package:ecco_app/features/login/data/repository/repo_reg_Impelment.dart';
import 'package:ecco_app/features/login/presentation/view_model/prov_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/utilities/AppApiService.dart';
import 'core/utilities/AppRouter.dart';
import 'core/utilities/cash_healper.dart';
import 'features/home/data/repository/home_repo_impl.dart';
import 'features/home/presentation/controller/home_prov.dart';
import 'features/nav_bar_root/presentation/controller/prov_nav_bar_root.dart';
import 'features/profile/data/repo/progile_repo_impl.dart';
import 'features/profile/presentation/controller/prov_profile.dart';
import 'features/register/data/repository/repoReg.dart';
import 'features/register/data/repository/repo_reg_Impelment.dart';
import 'features/register/presentation/controller/prov_reg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.casheinitialization();
  ApiService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final themData = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.deepOrange,
    primaryColorLight: Colors.deepOrange,
    appBarTheme: AppBarTheme(
      color: Colors.deepOrange,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ProvLogin(
                repoLogin: RepoLoginImpelment(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => RegisterProvider(
                repoRegister: RepoRegImpelment(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => HomeProvider(
                homeRepo: HomeRepoImpl(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => ProvNavBarRoot(),
            ),
            ChangeNotifierProvider(
              create: (_) => ProvProfile(
                profileRepo: ProfileRepoImpl(),
              ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themData,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
