
import 'package:flutter/material.dart';
import 'package:gallary_website_app/src/core/base/widget/base_stateful_widget.dart';
import 'package:gallary_website_app/src/presentation/widgets/custom_app_bar_widget.dart';

class LandingScreen extends BaseStatefulWidget {
  const LandingScreen({super.key});

  @override
  BaseState<LandingScreen> baseCreateState() => _LandingWebScreenState();
}

class _LandingWebScreenState extends BaseState<LandingScreen> {


  @override
  Widget baseBuild(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
         appBar: CustomAppBarWidget(
           search: (value) {},
         ),
        );
      },
    );
  }

}
