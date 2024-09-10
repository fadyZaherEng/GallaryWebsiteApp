import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_website_app/src/core/base/widget/base_stateful_widget.dart';
import 'package:gallary_website_app/src/core/utils/constants.dart';
import 'package:gallary_website_app/src/core/utils/show_image_dialog.dart';
import 'package:gallary_website_app/src/data/sources/remote/gallary_request.dart';
import 'package:gallary_website_app/src/data/sources/remote/landing/request/query_paramters_request.dart';
import 'package:gallary_website_app/src/domain/entities/gallary.dart';
import 'package:gallary_website_app/src/presentation/blocs/landing/landing_bloc.dart';
import 'package:gallary_website_app/src/presentation/screens/landing_app/widgets/footer_widget.dart';
import 'package:gallary_website_app/src/presentation/widgets/custom_app_bar_widget.dart';
import 'package:gallary_website_app/src/presentation/widgets/images_widget.dart';

class LandingScreen extends BaseStatefulWidget {
  const LandingScreen({super.key});

  @override
  BaseState<LandingScreen> baseCreateState() => _LandingWebScreenState();
}

class _LandingWebScreenState extends BaseState<LandingScreen> {
  List<ImageModel> images = [];

  LandingBloc get _bloc => BlocProvider.of<LandingBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(
      GetImagesEvent(
        GallaryRequest(),
        QueryParametersRequest(
          key: Constants.apiKey,
          imageType: "photo",
          q: "",
          perPage: 50,
        ),
      ),
    );
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(
      listener: (context, state) {
        if (state is GetImagesSuccess) {
          images = state.images;
        } else if (state is GetImagesFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SearchImagesSuccess) {
          images = state.images;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBarWidget(
            search: (value) {
              _bloc.add(SearchImageEvent(value));
            },
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: ImagesWidget(
                          isLoading: state is GetImagesLoading,
                          images: images,
                          isImagesScreen: true,
                          onImageTap: (int index) {
                            showImageDialog(
                              context: context,
                              images: images,
                              currentIndex: index,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const FooterWidget(),
            ],
          ),
        );
      },
    );
  }
}
