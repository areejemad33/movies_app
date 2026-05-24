import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';

import 'package:movies_app/features/movie_details/presentation/widgets/info_card.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/watch_button.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 645.h,
              placeholder: (context, url) => Container(color: Colors.black),
              errorWidget: (context, url, error) =>
                  Container(color: Colors.black),
            ),

            Container(
              height: 645.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(18, 19, 18, 0.2), Color(0xFF121312)],
                  stops: [0.0, 1.0],
                ),
              ),
            ),

            /// Dark Overlay
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ////////////////////////mn hna
                  const SizedBox(height: 120),

                  /// Play Button
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6BD00),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 8),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),

                  const SizedBox(height: 250),

                  /// Movie Title
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Doctor Strange in the Multiverse\nof Madness',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Year
                  const Text(
                    '2022',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 30),

                  WatchButton(),
                  const SizedBox(height: 16),

                  /// Info Cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Infocard(
                            icon: AssetsManager.favoritIcon,
                            text: '15',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Infocard(icon: AssetsManager.watchTime, text: '90'),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Infocard(
                            icon: AssetsManager.starIcon,
                            text: '7.6',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// Screenshots Title
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
