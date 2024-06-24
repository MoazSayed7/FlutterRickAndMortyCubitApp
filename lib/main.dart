import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_router.dart';
import 'constance/my_colors.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  runApp(
    RickAndMortyApp(
      appRouter: AppRouter(),
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  final AppRouter appRouter;
  const RickAndMortyApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: MyColors.grey,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
