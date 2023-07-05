part of 'screens.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late InterstitialAd _interstitialAd;
  _loadIntel() async {
    InterstitialAd.load(

      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          debugPrint("Ads is Loaded");
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ), adUnitId: '');
  }

  @override
  void initState() {
    _loadIntel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        width: 100.w,
        height: 100.h,
        decoration: kDecorBackground,
        padding: EdgeInsets.only(left: 10, right: 10, top: 3.h),
        child: Column(
          children: [
            const AppBarWelcome(),
            SizedBox(height: 5.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<LiveCatyBloc, LiveCatyState>(
                        builder: (context, state) {
                          if (state is LiveCatyLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is LiveCatySuccess) {
                            return CardWelcomeTv(
                              title: "LIVE TV",
                              subTitle: "${state.categories.length} Channels",
                              icon: kIconLive,
                              onTap: () {
                                Get.toNamed(screenLiveCategories)!
                                    .then((value) async {
                                  debugPrint("show interstitial");
                                  _interstitialAd.show();
                                  await _loadIntel();
                                });
                              },
                            );
                          }

                          return const Text('error live caty');
                        },
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: BlocBuilder<MovieCatyBloc, MovieCatyState>(
                        builder: (context, state) {
                          if (state is MovieCatyLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is MovieCatySuccess) {
                            return CardWelcomeTv(
                              title: "Movies",
                              subTitle: "${state.categories.length} Channels",
                              icon: kIconMovies,
                              onTap: () {
                                Get.toNamed(screenMovieCategories)!
                                    .then((value) async {
                                  await _interstitialAd.show();
                                  await _loadIntel();
                                });
                              },
                            );
                          }

                          return const Text('error movie caty');
                        },
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: BlocBuilder<SeriesCatyBloc, SeriesCatyState>(
                        builder: (context, state) {
                          if (state is SeriesCatyLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is SeriesCatySuccess) {
                            return CardWelcomeTv(
                              title: "Series",
                              subTitle: "${state.categories.length} Channels",
                              icon: kIconSeries,
                              onTap: () {
                                Get.toNamed(screenSeriesCategories)!
                                    .then((value) async {
                                  await _interstitialAd.show();
                                  await _loadIntel();
                                });
                              },
                            );
                          }

                          return const Text('could not load series');
                        },
                      ),
                    ),
                    /*  SizedBox(width: 2.w),
                    SizedBox(
                      width: 20.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CardWelcomeSetting(
                            title: 'Catch up',
                            icon: FontAwesomeIcons.rotate,
                            onTap: () {},
                          ),
                          CardWelcomeSetting(
                            title: 'Multi-Screen',
                            icon: FontAwesomeIcons.layerGroup,
                            onTap: () {},
                          ),
                          CardWelcomeSetting(
                            title: 'Settings',
                            icon: FontAwesomeIcons.gear,
                            onTap: () {
                              Get.toNamed(screenSettings);
                            },
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By using this application, you agree to the',
                  style: Get.textTheme.titleSmall!.copyWith(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await launchUrlString(kPrivacy);
                  },
                  child: Text(
                    ' Terms of Services.',
                    style: Get.textTheme.subtitle2!.copyWith(
                      fontSize: 12.sp,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
