import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_website_app/src/domain/entities/gallary.dart';
import 'package:gallary_website_app/src/presentation/blocs/main/main_bloc.dart';
import 'package:gallary_website_app/src/presentation/blocs/main/main_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

class ImagesWidget extends StatefulWidget {
  final bool isLoading;
  final List<ImageModel> images;
  final void Function(int) onImageTap;
  final bool isImagesScreen;

  const ImagesWidget({
    super.key,
    required this.isLoading,
    required this.images,
    required this.onImageTap,
    this.isImagesScreen = false,
  });

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  int? _hoverIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: const Responsive().isMobile(context)
                ? 2
                : const Responsive().isTablet(context)
                    ? 4
                    : 6, // Number of columns
            crossAxisSpacing: 10, // Space between columns
            mainAxisSpacing: 10, // Space between rows
            childAspectRatio: const Responsive().isMobile(context)
                ? 0.9
                : 0.8, // Aspect ratio of the grid items
          ),
          itemCount: widget.isLoading ? 30 : widget.images.length,
          itemBuilder: (context, index) {
            return widget.isLoading
                ? const Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: SkeletonLine(
                          style: SkeletonLineStyle(
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SkeletonLine(
                          style: SkeletonLineStyle(
                            width: double.infinity,
                            height: 90,
                          ),
                        ),
                      )
                    ],
                  )
                : MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        _hoverIndex = index;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _hoverIndex = null;
                      });
                    },
                    onHover: (_) {
                      setState(() {
                        _hoverIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: _hoverIndex == index
                          ? (Matrix4.identity()
                            ..scale(1.05, 1.05)
                            ..translate(0.0, -10.0))
                          : Matrix4.identity(),
                      child: GestureDetector(
                        onTap: () {
                          // if (widget.isImagesScreen) {
                          //   if (kIsWeb) {
                          //     widget.onImageTap(index);
                          //   } else {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => ImageScreen(
                          //                 movieId: widget.movies[index].id)));
                          //   }
                          // } else {
                          //   if (kIsWeb) {
                          //     context.go(Routes.movies);
                          //   } else {
                          //     Navigator.of(context).pushNamed(Routes.movies);
                          //   }
                          // }
                        },
                        child: Card(
                          elevation: _hoverIndex == index ? 20 : 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        widget.images[index].largeImageURL,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, error, stackTrace) =>
                                        const Icon(Icons.error, size: 100),
                                    matchTextDirection: true,
                                    placeholder: (context, _) {
                                      return const SkeletonLine(
                                        style: SkeletonLineStyle(
                                          width: double.infinity,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.label,
                                          size: 14,
                                          color: Colors.purple,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                            child: Text(
                                          widget.images[index].tags,
                                          style: GoogleFonts.titilliumWeb(
                                              fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                        ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.visibility,
                                          size: 14,
                                          color: Colors.purple,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                            child: Text(
                                          widget.images[index].views.toString(),
                                          style: GoogleFonts.titilliumWeb(
                                              fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                        ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.thumb_up,
                                          size: 14,
                                          color: Colors.purple,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.images[index].likes
                                                .toString(),
                                            style: GoogleFonts.titilliumWeb(
                                                fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}

class Responsive {
  const Responsive();

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width < 1100;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
