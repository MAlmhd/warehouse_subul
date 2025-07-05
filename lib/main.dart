import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warehouse_subul/core/routing/app_router.dart';

import 'package:warehouse_subul/core/utils/service_locator.dart';
import 'package:warehouse_subul/core/utils/simple_bloc_observer.dart';
import 'package:warehouse_subul/features/sign_in/presentation/views/sign_in_screen.dart';

void main() {
   setupServiceLocator();

  Bloc.observer = SimpleBlocObserver();
  runApp( MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            onGenerateRoute: appRouter.generateRoute,
            locale: Locale('ar'),
            supportedLocales: [Locale('en')],

            debugShowCheckedModeBanner: false,
            theme: ThemeData(textTheme: GoogleFonts.almaraiTextTheme()),
            home:  SignInScreen()
              
          ),
    );
  }
}

