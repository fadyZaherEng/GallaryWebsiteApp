import 'package:gallary_website_app/src/core/resources/data_state.dart';
import 'package:gallary_website_app/src/data/sources/remote/gallary_request.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/request/query_paramters_request.dart';
import 'package:gallary_website_app/src/domain/entities/gallary.dart';
import 'package:gallary_website_app/src/domain/repositories/landing_repository.dart';

class GetImagesUseCase {
  final LandingRepository _landingRepository;

  GetImagesUseCase(this._landingRepository);

  Future<DataState<List<ImageModel>>> call(GallaryRequest request,
      QueryParametersRequest queryParametersRequest) async {
    return await _landingRepository.getImages(request, queryParametersRequest);
  }
}
