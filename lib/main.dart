import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/routes/routes_all.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  camera = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WhatsApp Clone',
            theme: ThemeData(
              fontFamily: "OpenSans",
              colorScheme: ColorScheme.fromSeed(seedColor: tealGreen),
              useMaterial3: true,
            ),
            initialRoute: RouteGenerator.status,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}
