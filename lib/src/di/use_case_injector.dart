import 'package:gallary_website_app/src/di/data_layer_injector.dart';
import 'package:gallary_website_app/src/domain/usecase/get_language_use_case.dart';
import 'package:gallary_website_app/src/domain/usecase/landing/get_images_use_case.dart';
import 'package:gallary_website_app/src/domain/usecase/set_language_use_case.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<SetLanguageUseCase>(
      () => SetLanguageUseCase(injector()));

  injector.registerFactory<GetLanguageUseCase>(
      () => GetLanguageUseCase(injector()));
  injector
      .registerFactory<GetImagesUseCase>(() => GetImagesUseCase(injector()));
}
