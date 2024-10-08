import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gallary_website_app/generated/l10n.dart';
import 'package:gallary_website_app/src/config/routes/routes_manager.dart';
import 'package:gallary_website_app/src/core/utils/bloc_observer.dart';
import 'package:gallary_website_app/src/core/utils/firebase_notification_services.dart';
import 'package:gallary_website_app/src/core/utils/hms_notification_service.dart';
import 'package:gallary_website_app/src/core/utils/network_connectivity.dart';
import 'package:gallary_website_app/src/di/injector.dart';
import 'package:gallary_website_app/src/presentation/blocs/landing/landing_bloc.dart';
import 'package:gallary_website_app/src/presentation/blocs/main/main_bloc.dart';
import 'package:gallary_website_app/src/presentation/blocs/main/main_state.dart';
import 'package:gallary_website_app/src/presentation/widgets/restart_widget.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:huawei_hmsavailability/huawei_hmsavailability.dart';
import 'package:provider/provider.dart';

import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  if (!kIsWeb) {
    try {
      if (Platform.isIOS) {
        await _initializeFirebaseServices();
      } else {
        final int resultCode =
        await HmsApiAvailability().isHMSAvailableWithApkVersion(28);
        if (resultCode == 1) {
          await _initializeFirebaseServices();
        } else {
          await _initializeHuaweiServices();
        }
      }
    } catch (e) {}
  }
  setPathUrlStrategy();
  runApp(
    const RestartWidget(MyApp()),
  );
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      NetworkConnectivity.instance.initializeInternetConnectivityStream();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(create: (context) => injector()),
        BlocProvider<LandingBloc>(create: (context) => injector()),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return StreamBuilder(
              stream: NetworkConnectivity.instance.myStream,
              builder: (mContext, snapshot) {
                if (snapshot.hasData && !kIsWeb) {
                 // ConnectivityResult connectivityResult = snapshot.data;
                // if (connectivityResult == ConnectivityResult.none) {
                //   if (!NetworkConnectivity.instance.isShowNoInternetDialog) {
                //     //   showNoInternetDialogWidget(
                //     //       context: navigatorKey.currentContext ?? context,
                //     //       onTapTryAgain: () {});
                //   }
                //   NetworkConnectivity.instance.isShowNoInternetDialog = true;
                // } else {
                //   if (NetworkConnectivity.instance.isShowNoInternetDialog &&
                //       Navigator.canPop(
                //           navigatorKey.currentContext ?? context)) {
                //     Navigator.of(navigatorKey.currentContext ?? context)
                //         .pop();
                //     NetworkConnectivity.instance.isShowNoInternetDialog =
                //         false;
                //   }
                // }

                }
                return Portal(
                child: Provider.value(
                value: routeObserver,
                child: kIsWeb
                ? MaterialApp.router(
                routerConfig: webRouter,
                themeMode: state is MainChangeLangAndTheme
                ? state.theme
                    : ThemeMode.light,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                locale: state is MainChangeLangAndTheme
                ? Locale(state.lang)
                    : const Locale('ar'),
                )
                    : MaterialApp(
                // useInheritedMediaQuery: true,
                // builder: DevicePreview.appBuilder,
                // darkTheme:AppTheme(state.languageCode).light,
                navigatorKey: navigatorKey,
                navigatorObservers: [
                ChuckerFlutter.navigatorObserver,
                routeObserver,
                ],
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: RoutesManager.getRoute,
                // initialRoute: Routes.landingWeb,
                localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                themeMode: state is MainChangeLangAndTheme
                ? state.theme
                    : ThemeMode.light,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                locale: state is MainChangeLangAndTheme
                ? Locale(state.lang)
                    : const Locale('ar'),
                )
                ,
                )
                ,
                );
              });
        },
      ),
    );
  }
}

Future<void> _initializeFirebaseServices() async {
  try {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    await FirebaseNotificationService().initializeNotificationService();
    Bloc.observer = const SimpleBlocObserver();
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } catch (e) {}
}

Future<void> _initializeHuaweiServices() async {
  await HMSNotificationServices().initializeNotificationService();
}
