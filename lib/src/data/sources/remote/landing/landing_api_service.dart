import 'package:dio/dio.dart';
import 'package:gallary_website_app/src/data/sources/remote/api_key.dart';
import 'package:gallary_website_app/src/data/sources/remote/gallary_request.dart';
import 'package:gallary_website_app/src/data/sources/remote/gallary_response.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/entities/remote_image_model.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/request/query_paramters_request.dart';
import 'package:retrofit/retrofit.dart';

part 'landing_api_service.g.dart';

@RestApi()
abstract class LandingApiServices {
  factory LandingApiServices(Dio dio) = _LandingApiServices;

  @GET(APIKeys.apiKeyEndPoint)
  Future<HttpResponse<GallaryResponse<List<RemoteImageModel>>>> getSearchImages(
    // @Body() GallaryRequest request,
    @Queries() QueryParametersRequest queryParametersRequest,
  );
}
