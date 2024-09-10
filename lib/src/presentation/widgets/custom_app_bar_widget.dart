import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_website_app/generated/l10n.dart';
import 'package:gallary_website_app/src/domain/entities/responsive.dart';
import 'package:gallary_website_app/src/presentation/blocs/main/main_bloc.dart';
import 'package:gallary_website_app/src/presentation/blocs/main/main_state.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final void Function(String value) search;

  const CustomAppBarWidget({
    super.key,
    required this.search,
  });

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  MainCubit get _cubit => BlocProvider.of<MainCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    S.of(context).gallary,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: Responsive.isMobile(context) ? 14 : 24,
                      fontWeight: FontWeight.bold,
                      color:_cubit.isDarkMode? Colors.white: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                Flexible(
                  child: SizedBox(
                    width: Responsive.isMobile(context)
                        ? MediaQuery.of(context).size.width * 0.3
                        : MediaQuery.of(context).size.width * 0.55,
                    height: 55,
                    child: SearchBar(
                      onSubmitted: (value) {
                        widget.search(value);
                      },
                      onChanged: (value) {
                        widget.search(value);
                      },
                      trailing: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_sharp,
                            color: Colors.purple,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            Center(
              child: Padding(
                padding:  EdgeInsetsDirectional.fromSTEB(0, 20,Responsive.isMobile(context)? 10 : 20, 0),
                child: Switch(
                  value: _cubit.isDarkMode,
                  onChanged: (value) {
                    _cubit.toggleTheme(value);
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
