import 'package:gallary_website_app/src/data/reposoitories_implementation/landing_repository_implementation.dart';
import 'package:gallary_website_app/src/di/data_layer_injector.dart';
import 'package:gallary_website_app/src/domain/repositories/landing_repository.dart';

Future<void> initializeRepositoryDependencies() async {
  injector.registerFactory<LandingRepository>(
      () => LandingRepositoryImplementation(injector()));
}
