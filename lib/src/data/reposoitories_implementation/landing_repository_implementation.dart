import 'dart:html';

import 'package:dio/dio.dart';
import 'package:gallary_website_app/src/core/resources/data_state.dart';
import 'package:gallary_website_app/src/data/sources/remote/gallary_request.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/entities/remote_image_model.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/landing_api_service.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/request/query_paramters_request.dart';
import 'package:gallary_website_app/src/domain/entities/gallary.dart';
import 'package:gallary_website_app/src/domain/repositories/landing_repository.dart';

class LandingRepositoryImplementation implements LandingRepository {
  final LandingApiServices _landingApiServices;

  LandingRepositoryImplementation(this._landingApiServices);

  @override
  Future<DataState<List<ImageModel>>> getImages(GallaryRequest<dynamic> request,
      QueryParametersRequest queryParametersRequest) async {
    try {
      GallaryRequest request = await GallaryRequest().createRequest(null);
      final httpResponse = await _landingApiServices.getSearchImages(
          // request,
          queryParametersRequest);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: (httpResponse.data.hits ?? []).mapToImageModelList(),
          message: httpResponse.response.statusMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "Failed",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "bad Response",
      );
    }
  }
}
