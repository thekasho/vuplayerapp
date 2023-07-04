part of 'widgets.dart';

class AppBarLive extends StatefulWidget {
  const AppBarLive({Key? key, this.onSearch}) : super(key: key);
  final Function(String)? onSearch;

  @override
  State<AppBarLive> createState() => _AppBarLiveState();
}

class _AppBarLiveState extends State<AppBarLive> {
  bool showSearch = false;
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image(
            width: 0.3.dp,
            height: 0.3.dp,
            image: const AssetImage(kIconSplash),
          ),
          const SizedBox(width: 5),
          Text(
            kAppName,
            style: Get.textTheme.headline4,
          ),
          Container(
            width: 1,
            height: 8.h,
            margin: const EdgeInsets.symmetric(horizontal: 13),
            color: kColorHint,
          ),
          Image(height: 9.h, image: const AssetImage(kIconLive)),
          const Spacer(),
          /* showSearch
              ? Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: TextField(
                      controller: _search,
                      onChanged: widget.onSearch,
                      decoration: InputDecoration(
                          hintText: "Search...",
                          suffixIcon: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.xmark,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                showSearch = false;
                                _search.clear();
                              });
                            },
                          )),
                    ),
                  ),
                )
              : const Spacer(),
          if (!showSearch)
            IconButton(
              focusColor: kColorFocus,
              onPressed: () {
                setState(() {
                  showSearch = true;
                });
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.white,
              ),
            ),*/

          IconButton(
            focusColor: kColorFocus,
            onPressed: () {
              context.read<VideoCubit>().changeUrlVideo(false);
              Get.back();
            },
            icon: const Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarMovie extends StatelessWidget {
  const AppBarMovie(
      {Key? key, this.showSearch = true, this.onFavorite, this.top})
      : super(key: key);
  final bool showSearch;
  final Function()? onFavorite;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: top ?? 2.h),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Image(
              width: 0.3.dp,
              height: 0.3.dp,
              image: const AssetImage(kIconSplash),
            ),
            const SizedBox(width: 5),
            Text(
              kAppName,
              style: Get.textTheme.headline4,
            ),
            Container(
              width: 1,
              height: 8.h,
              margin: const EdgeInsets.symmetric(horizontal: 13),
              color: kColorHint,
            ),
            Image(height: 9.h, image: const AssetImage(kIconMovies)),
            const Spacer(),
            /*   if (showSearch)
              IconButton(
                focusColor: kColorFocus,
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                ),
              ),*/
            if (onFavorite != null)
              IconButton(
                focusColor: kColorFocus,
                onPressed: onFavorite,
                icon: const Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.white,
                ),
              ),
            IconButton(
              focusColor: kColorFocus,
              onPressed: () {
                context.read<VideoCubit>().changeUrlVideo(false);
                Get.back();
              },
              icon: const Icon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarSeries extends StatelessWidget {
  const AppBarSeries(
      {Key? key, this.showSearch = true, this.onFavorite, this.top})
      : super(key: key);
  final bool showSearch;
  final Function()? onFavorite;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(top: top ?? 4.h, left: 10, right: 10),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Image(
              width: 0.3.dp,
              height: 0.3.dp,
              image: const AssetImage(kIconSplash),
            ),
            const SizedBox(width: 5),
            Text(
              kAppName,
              style: Get.textTheme.headline4,
            ),
            Container(
              width: 1,
              height: 8.h,
              margin: const EdgeInsets.symmetric(horizontal: 13),
              color: kColorHint,
            ),
            Image(height: 9.h, image: const AssetImage(kIconSeries)),
            const Spacer(),
            /*if (showSearch)
              IconButton(
                focusColor: kColorFocus,
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                ),
              ),*/
            if (onFavorite != null)
              IconButton(
                focusColor: kColorFocus,
                onPressed: onFavorite,
                icon: const Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.white,
                ),
              ),
            IconButton(
              focusColor: kColorFocus,
              onPressed: () {
                context.read<VideoCubit>().changeUrlVideo(false);
                Get.back();
              },
              icon: const Icon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarSettings extends StatelessWidget {
  const AppBarSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: Colors.transparent,
      //  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Image(
            width: 0.3.dp,
            height: 0.3.dp,
            image: const AssetImage(kIconSplash),
          ),
          const SizedBox(width: 5),
          Text(
            "Settings",
            style: Get.textTheme.headline4,
          ),
          Container(
            width: 1,
            height: 8.h,
            margin: const EdgeInsets.symmetric(horizontal: 13),
            color: kColorHint,
          ),
          Icon(
            FontAwesomeIcons.gear,
            size: 20.sp,
            color: Colors.white,
          ),
          const Spacer(),
          IconButton(
            focusColor: kColorFocus,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CardLiveItem extends StatelessWidget {
  const CardLiveItem(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isSelected = false,
      this.link,
      this.image})
      : super(key: key);
  final String title;
  final Function() onTap;
  final bool isSelected;
  final String? link;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: kColorFocus,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          color: kColorCardLight,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: Colors.yellow) : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            image != null && !isSelected
                ? CachedNetworkImage(
                    imageUrl: image ?? "",
                    width: 9.w,
                    errorWidget: (_, i, e) {
                      return Icon(
                        FontAwesomeIcons.tv,
                        size: isSelected ? 18.sp : 16.sp,
                        color: Colors.white,
                      );
                    },
                  )
                : Icon(
                    isSelected ? FontAwesomeIcons.play : FontAwesomeIcons.tv,
                    size: isSelected ? 18.sp : 16.sp,
                    color: Colors.white,
                  ),
            const SizedBox(width: 13),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.headline5!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            if (isSelected && link != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  FontAwesomeIcons.expand,
                  size: 18.sp,
                  color: isSelected ? Colors.yellow : null,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
