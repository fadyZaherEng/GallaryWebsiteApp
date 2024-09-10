import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallary_website_app/src/domain/entities/gallary.dart';
import 'package:gallary_website_app/src/domain/entities/responsive.dart';
import 'package:skeletons/skeletons.dart';

class DialogImageWidget extends StatefulWidget {
  int currentIndex;
  final List<ImageModel> images;

  DialogImageWidget({
    super.key,
    this.currentIndex = 0,
    required this.images,
  });

  @override
  State<DialogImageWidget> createState() => _DialogImageWidgetState();
}

class _DialogImageWidgetState extends State<DialogImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.47,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // gradient: LinearGradient(
        //     colors: [Colors.white, Colors.black12],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(children: [
              Positioned(
                top: Responsive.isMobile(context)
                    ? MediaQuery.of(context).size.height * 0.08
                    : MediaQuery.of(context).size.height * 0.06,
                left: 5,
                right: 5,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.currentIndex > 0) {
                            widget.currentIndex--;
                          }
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              widget.images[widget.currentIndex].largeImageURL,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) =>
                              const Icon(
                            Icons.error,
                            weight: double.infinity,
                            size: 180,
                          ),
                          matchTextDirection: true,
                          placeholder: (context, _) {
                            return const SkeletonLine(
                              style: SkeletonLineStyle(
                                width: double.infinity,
                                height: double.infinity,
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
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.currentIndex < widget.images.length - 1) {
                            widget.currentIndex++;
                          }
                        });
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                top: 20,
                end: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close, color: Colors.black),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Text(
            '${widget.currentIndex + 1}/${widget.images.length}',
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          Responsive.isMobile(context)
              ? const SizedBox(height: 20)
              : const SizedBox(
                  height: 40,
                ),
        ],
      ),
    );
  }
}
