import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallary_website_app/src/core/resources/data_state.dart';
import 'package:gallary_website_app/src/core/utils/constants.dart';
import 'package:gallary_website_app/src/data/sources/remote/gallary_request.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/request/query_paramters_request.dart';
import 'package:gallary_website_app/src/domain/entities/gallary.dart';
import 'package:gallary_website_app/src/domain/usecase/landing/get_images_use_case.dart';
import 'package:meta/meta.dart';

part 'landing_event.dart';

part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final GetImagesUseCase _getImagesUseCase;
  List<ImageModel> images = [];

  LandingBloc(
    this._getImagesUseCase,
  ) : super(LandingInitial()) {
    on<GetImagesEvent>(_onGetImagesEvent);
    on<SearchImageEvent>(_onSearchImageEvent);
  }

  FutureOr<void> _onGetImagesEvent(
      GetImagesEvent event, Emitter<LandingState> emit) async {
    emit(GetImagesLoading());
    DataState<List<ImageModel>> result = await _getImagesUseCase(
      event.request,
      event.queryParametersRequest,
    );
    if (result is DataSuccess) {
      images = result.data ?? [];
      emit(GetImagesSuccess(images: result.data ?? []));
    } else if (result is DataFailed) {
      emit(GetImagesFailed(message: result.message ?? "Something went wrong"));
    }
  }

  FutureOr<void> _onSearchImageEvent(
      SearchImageEvent event, Emitter<LandingState> emit) async {
    emit(SearchImagesLoading());
    if (event.query.isEmpty) {
      emit(GetImagesSuccess(images: images));
    } else {
      DataState<List<ImageModel>> result = await _getImagesUseCase(
        GallaryRequest(),
        QueryParametersRequest(
          key: Constants.apiKey,
          imageType: "photo",
          q: event.query,
          perPage: 18,
          page: event.pageIndex,
        ),
      );
      if (result is DataSuccess) {
        List<ImageModel> searchImages = [];
        searchImages = (result.data ?? [])
            .where(
              (element) =>
                  element.largeImageURL
                      .toLowerCase()
                      .contains(event.query.toLowerCase()) ||
                  element.tags
                      .toLowerCase()
                      .contains(event.query.toLowerCase()) ||
                  element.user
                      .toLowerCase()
                      .contains(event.query.toLowerCase()) ||
                  element.type
                      .toLowerCase()
                      .contains(event.query.toLowerCase()),
            ).toList();

        emit(SearchImagesSuccess(images: searchImages));
      } else if (result is DataFailed) {
        emit(
            GetImagesFailed(message: result.message ?? "Something went wrong"));
      }
    }
  }
}
