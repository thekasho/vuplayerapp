part of '../screens.dart';

class StreamPlayerPage extends StatefulWidget {
  const StreamPlayerPage({Key? key, required this.controller})
      : super(key: key);
  final VlcPlayerController? controller;

  @override
  State<StreamPlayerPage> createState() => _StreamPlayerPageState();
}

class _StreamPlayerPageState extends State<StreamPlayerPage> {
  // VlcPlayerController? _videoPlayerController;
  bool isPlayed = true;
  String position = '';
  String duration = '';
  double sliderValue = 0.0;
  bool validPosition = false;
  bool showControllersVideo = true;

  @override
  void initState() {
    // debugPrint("RUN URL ${widget.link}");
    // _videoPlayerController = widget.controller;

    super.initState();
    //
    // if(widget.controller !=null){
    //   widget.controller!.addListener(listener);
    // }
  }

  void listener() async {
    if (!mounted) return;

    if (widget.controller != null && widget.controller!.value.isInitialized) {
      var oPosition = widget.controller!.value.position;
      var oDuration = widget.controller!.value.duration;

      if (oDuration.inHours == 0) {
        var strPosition = oPosition.toString().split('.')[0];
        var strDuration = oDuration.toString().split('.')[0];
        position = "${strPosition.split(':')[1]}:${strPosition.split(':')[2]}";
        duration = "${strDuration.split(':')[1]}:${strDuration.split(':')[2]}";
      } else {
        position = oPosition.toString().split('.')[0];
        duration = oDuration.toString().split('.')[0];
      }
      validPosition = oDuration.compareTo(oPosition) >= 0;
      sliderValue = validPosition ? oPosition.inSeconds.toDouble() : 0;
      if (!mounted) {
        setState(() {});
      }
    }
  }

  void _onSliderPositionChanged(double progress) {
    if (!mounted) {
      setState(() {
        sliderValue = progress.floor().toDouble();
      });
      //convert to Milliseconds since VLC requires MS to set time
      widget.controller!.setTime(sliderValue.toInt() * 1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller == null) {
      return const Center(
        child: Text(
          'Select a player...',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          VlcPlayer(
            controller: widget.controller!,
            aspectRatio: 16 / 9,
            placeholder: const Center(child: CircularProgressIndicator()),
          ),

          ///Controllers
          BlocBuilder<VideoCubit, VideoState>(
            builder: (context, state) {
              if (!state.isFull) {
                return const SizedBox();
              }

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: !showControllersVideo
                    ? const SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: IconButton(
                              focusColor: kColorFocus,
                              onPressed: () {
                                context
                                    .read<VideoCubit>()
                                    .changeUrlVideo(false);
                                //Get.back();
                              },
                              icon: const Icon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                focusColor: kColorFocus,
                                onPressed: () {
                                  setState(() {
                                    if (isPlayed) {
                                      widget.controller!.pause();
                                      isPlayed = false;
                                    } else {
                                      widget.controller!.play();
                                      isPlayed = true;
                                    }
                                  });
                                },
                                icon: Icon(
                                  isPlayed
                                      ? FontAwesomeIcons.pause
                                      : FontAwesomeIcons.play,
                                  size: 20.sp,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      position,
                                      style: Get.textTheme.subtitle2!.copyWith(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    Expanded(
                                      child: Slider(
                                        activeColor: Colors.redAccent,
                                        inactiveColor: Colors.white70,
                                        value: sliderValue,
                                        min: 0.0,
                                        max:
                                            (!validPosition) //&& widget.controller!.value.duration == null
                                                ? 1.0
                                                : widget.controller!.value
                                                    .duration.inSeconds
                                                    .toDouble(),
                                        onChanged: validPosition
                                            ? _onSliderPositionChanged
                                            : null,
                                      ),
                                    ),
                                    Text(
                                      duration,
                                      style: Get.textTheme.subtitle2!.copyWith(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
