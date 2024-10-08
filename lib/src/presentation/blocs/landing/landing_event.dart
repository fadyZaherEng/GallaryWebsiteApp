part of 'landing_bloc.dart';

@immutable
sealed class LandingEvent {}
//get images
class GetImagesEvent extends LandingEvent {
  final GallaryRequest request;
  final QueryParametersRequest queryParametersRequest;
  GetImagesEvent(this.request, this.queryParametersRequest);
}
//searchImage
class SearchImageEvent extends LandingEvent {
  final String query;
  final int pageIndex ;
  SearchImageEvent(this.query, this.pageIndex);
}