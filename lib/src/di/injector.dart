
import 'package:gallary_website_app/src/di/bloc_injector.dart';
import 'package:gallary_website_app/src/di/data_layer_injector.dart';
import 'package:gallary_website_app/src/di/repository_injector.dart';
import 'package:gallary_website_app/src/di/use_case_injector.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeDataDependencies();
  await initializeRepositoryDependencies();
  await initializeUseCaseDependencies();
  await initializeBlocDependencies();
}
