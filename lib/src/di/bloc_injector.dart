import 'package:gallary_website_app/src/di/data_layer_injector.dart';
import 'package:gallary_website_app/src/presentation/blocs/landing/landing_bloc.dart';
import 'package:gallary_website_app/src/presentation/blocs/main/main_bloc.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<MainCubit>(() => MainCubit(
        injector(),
        injector(),
      ));
  injector.registerFactory<LandingBloc>(() => LandingBloc(injector()));
}
