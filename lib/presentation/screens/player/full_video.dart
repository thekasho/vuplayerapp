part of '../screens.dart';

class FullVideoScreen extends StatefulWidget {
  const FullVideoScreen({Key? key, required this.link}) : super(key: key);
  final String link;

  @override
  State<FullVideoScreen> createState() => _FullVideoScreenState();
}

class _FullVideoScreenState extends State<FullVideoScreen> {
  late VlcPlayerController _videoPlayerController;
  bool isPlayed = true;
  bool progress = true;
  bool showControllersVideo = true;
  String position = '';
  String duration = '';
  double sliderValue = 0.0;
  bool validPosition = false;

  @override
  void initState() {
    _videoPlayerController = VlcPlayerController.network(
      widget.link,
      hwAcc: HwAcc.full,
      autoPlay: true,
      autoInitialize: true,
      options: VlcPlayerOptions(),
    );
    super.initState();
    _videoPlayerController.addListener(listener);
  }

  void listener() async {
    if (!mounted) return;

    if (progress) {
      if (_videoPlayerController.value.isPlaying) {
        setState(() {
          progress = false;
        });
      }
    }

    if (_videoPlayerController.value.isInitialized) {
      var oPosition = _videoPlayerController.value.position;
      var oDuration = _videoPlayerController.value.duration;

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
      setState(() {});
    }
  }

  void _onSliderPositionChanged(double progress) {
    setState(() {
      sliderValue = progress.floor().toDouble();
    });
    //convert to Milliseconds since VLC requires MS to set time
    _videoPlayerController.setTime(sliderValue.toInt() * 1000);
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            color: Colors.black,
            child: VlcPlayer(
              controller: _videoPlayerController,
              aspectRatio: 16 / 9,
              virtualDisplay: true,
              placeholder: const SizedBox(),
            ),
          ),
          if (progress)
            const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            )),

          // Container(
          //   width: 100.w,
          //   height: 100.h,
          //   color: Colors.black,
          // ),

          ///Controllers
          GestureDetector(
            onTap: () {
              setState(() {
                showControllersVideo = !showControllersVideo;
              });
            },
            child: Container(
              width: 100.w,
              height: 100.h,
              color: Colors.transparent,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: !showControllersVideo
                    ? const SizedBox()
                    : Material(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              focusColor: kColorFocus,
                              onPressed: () => Get.back(),
                              icon: Icon(
                                FontAwesomeIcons.chevronRight,
                                size: 20.sp,
                              ),
                            ),
                            if (!progress)
                              Center(
                                child: IconButton(
                                  focusColor: kColorFocus,
                                  autofocus: true,
                                  onPressed: () {
                                    setState(() {
                                      if (isPlayed) {
                                        _videoPlayerController.pause();
                                        isPlayed = false;
                                      } else {
                                        _videoPlayerController.play();
                                        isPlayed = true;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    isPlayed
                                        ? FontAwesomeIcons.pause
                                        : FontAwesomeIcons.play,
                                    size: 25.sp,
                                  ),
                                ),
                              ),

                            ///Controllers
                            if (!progress)
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        position,
                                        style:
                                            Get.textTheme.subtitle2!.copyWith(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: IgnorePointer(
                                          child: Slider(
                                            activeColor: Colors.redAccent,
                                            inactiveColor: Colors.white70,
                                            value: sliderValue,
                                            min: 0.0,
                                            max:
                                                (!validPosition) //&& _videoPlayerController.value.duration == null
                                                    ? 1.0
                                                    : _videoPlayerController
                                                        .value
                                                        .duration
                                                        .inSeconds
                                                        .toDouble(),
                                            onChanged: validPosition
                                                ? _onSliderPositionChanged
                                                : null,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        duration,
                                        style:
                                            Get.textTheme.subtitle2!.copyWith(
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
