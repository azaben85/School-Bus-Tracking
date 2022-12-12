import 'package:bustracker/app_router/app_router.dart';
import 'package:bustracker/firebase_options.dart';
import 'package:bustracker/students/providers/student_provider.dart';
import 'package:bustracker/students/views/screens/display_students_screen.dart';
import 'package:bustracker/students/views/screens/manage_student_screen.dart';
import 'package:bustracker/views/screens/bus_main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions().currentPlatform,
  );
  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  MyAPP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<StudentProvider>(
        create: (context) {
          return StudentProvider();
        },
      ),
    ], child: InitApp());
  }
}

class InitApp extends StatelessWidget {
  const InitApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          navigatorKey: AppRouter.appRouter.navigatorKey,
          debugShowCheckedModeBanner: false,
          home: BusMainScreen(),
        );
      },
    );
  }
}
