import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'logic/cubit/authentication_cubit.dart';
import 'logic/cubit/visit_recorder_cubit.dart';
import 'presentation/routers/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.setNavigationAndStatusBar();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
            create: (context) => AuthenticationCubit()),
        BlocProvider<VisitRecorderCubit>(
            create: (context) => VisitRecorderCubit()),
      ],
      child: NeumorphicApp(
        title: Strings.appName,
        themeMode: ThemeMode.light,
        theme: NeumorphicThemeData(
          baseColor: Color(0xffDDDDDD),
          accentColor: AppTheme.primaryColor,
          variantColor: AppTheme.colorPallet[900],
          lightSource: LightSource.topLeft,
          depth: 6,
          intensity: 1.4,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.intro,
      ),
    );
  }
}
