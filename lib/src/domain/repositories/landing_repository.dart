import 'package:gallary_website_app/src/core/resources/data_state.dart';
import 'package:gallary_website_app/src/data/sources/remote/gallary_request.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/entities/remote_image_model.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/request/query_paramters_request.dart';
import 'package:gallary_website_app/src/domain/entities/gallary.dart';

abstract class LandingRepository {
  Future<DataState<List<ImageModel>>> getImages(
      GallaryRequest request,
      QueryParametersRequest queryParametersRequest,
      );
}