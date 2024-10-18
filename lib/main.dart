import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_bloc.dart';
import 'package:untitled/features/presentation/cubit/data_cubit.dart';
import 'package:untitled/features/presentation/cubit/localization_cubit.dart';
import 'package:untitled/l10n/jsonlocalization.dart';
import 'package:untitled/l10n/l10n_class.dart';
import 'package:untitled/config/routes/routes.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/remote/remote_nasa_article_bloc.dart';
import 'package:untitled/features/presentation/cubit/index_cubit.dart';
import 'features/presentation/cubit/theme_cubit.dart';
import 'injection_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/presentation/pages/introduction/introduction_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initializeDependencies();
  runApp(DevicePreview(
      enabled: false, // !kReleaseMode
      builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteNasaArticleBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<IndexCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => sl()..loadLanguage(),
        ),
        BlocProvider<ThemeCubit>(create: (context) => sl()..loadTheme()),
        BlocProvider<DataCubit>(create: (context) => sl()),
        BlocProvider<LocalPlanetBloc>(
          create: (context) => sl(),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, String>(
        builder: (context, language) {
          return BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, theme) {
              return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (_, child) {
                    return MaterialApp(
                      checkerboardOffscreenLayers: false,
                      useInheritedMediaQuery: false,
                      builder: DevicePreview.appBuilder,
                      locale: Locale(language),
                      localeResolutionCallback: (locale, supportedLocales) {
                        for (var supportedLocale in supportedLocales) {
                          if (supportedLocale.languageCode ==
                              locale!.languageCode) {
                            return supportedLocale;
                          }
                        }
                        if (locale?.languageCode == 'ru') {
                          return Locale('ru');
                        }
                        return Locale('en');
                      },
                      supportedLocales: L10n.all,
                      localizationsDelegates: [
                        JsonLocalizations.delegate,
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      onGenerateRoute: AppRoutes.onGenerateRoutes,
                      debugShowCheckedModeBanner: false,
                      title: 'Planeta',
                      theme: theme,
                      home: IntroductionPage(), // BottomNavigation()
                    );
                  });
            },
          );
        },
      ),
    );
  }
}
