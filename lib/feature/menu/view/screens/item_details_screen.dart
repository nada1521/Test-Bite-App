import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/filter_category_response_model.dart';
import '../logic/item_details/item_details_cubit.dart';
import '../logic/item_details/item_details_state.dart';
import '../widgets/item_details_widget.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.itemDetails});
  final ItemMenuModel itemDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
          builder: (context, state) {
            if (state is ItemDetailsSuccess) {
              final item = state.categories[0];
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.5,
                    pinned: true,
                    floating: false,
                    snap: false,
                    stretch: true,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.only(left: 45, bottom: 15),
                      centerTitle: false,
                      title: Text(
                        item.strMeal,
                        style: AppTextStyle.fontWeightW400Size18TextSecondColor
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.textSecondColor2,
                            ),
                      ),
                      background: ImageWidgetModel(image: item.strMealThumb),
                    ),
                  ),
                  ItemDetailsWidget(itemDetails: item),
                ],
              );
            } else if (state is ItemDetailsFailure) {
              return Center(child: Text(state.error));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class ImageWidgetModel extends StatelessWidget {
  const ImageWidgetModel({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => pushTo(context, ImageScreen(image: image)),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Image.network(
                image,
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.white.withAlpha(130),
                        AppColors.black.withAlpha(100),
                        AppColors.black.withAlpha(200),
                      ],
                    ),
                  ),
                ),
              ),
              // BackContainerWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Image.network(
        image,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late YoutubePlayerController _controller;
  final TextEditingController _urlController = TextEditingController();
  String? _videoId;

  @override
  void initState() {
    super.initState();
    _videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _initializePlayer();
  }

  void _initializePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: _videoId ?? " no link",
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
      ),
    );
  }

  // void _loadVideo() {
  //   String url = _urlController.text.trim();
  //   String? videoId = YoutubePlayer.convertUrlToId(url);

  //   if (videoId != null) {
  //     setState(() {
  //       _videoId = videoId;
  //       _controller.load(videoId);
  //     });
  //     FocusScope.of(context).unfocus();
  //   } else {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('رابط يوتيوب غير صحيح')));
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      progressColors: ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
      ),
      onReady: () {
        log('المشغل جاهز');
      },
    );
  }
}
