part of 'landing_bloc.dart';

@immutable
sealed class LandingState {}

final class LandingInitial extends LandingState {}
//get images
final class GetImagesLoading extends LandingState {}
final class GetImagesSuccess extends LandingState {
  final List<ImageModel> images;
  GetImagesSuccess({required this.images});
}
final class GetImagesFailed extends LandingState {
  final String message;
  GetImagesFailed({required this.message});
}