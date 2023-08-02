import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc_example/config/local/app_localizations_setup.dart';
import 'package:flutter_clean_arc_example/config/routes/app_routes.dart';
import 'package:flutter_clean_arc_example/config/thems/app_theme.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';
import 'package:flutter_clean_arc_example/features/splash/presentation/cubit/local_cubit.dart';
import 'injection_container.dart' as di;

class Quote extends StatelessWidget {
  const Quote({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<LocalCubit>()..getSavedLang()),
        ],
        child: BlocBuilder<LocalCubit, LocalState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appName,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
              AppLocalizationsSetup.localizationsDelegates,
            );
          },
        ));
  }
}