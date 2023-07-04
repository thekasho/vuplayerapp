part of 'widgets.dart';

class AppBarWelcome extends StatelessWidget {
  const AppBarWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 11.h,
      // margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15),
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
          Expanded(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  final userInfo = state.user.userInfo;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dateNowWelcome(),
                        style: Get.textTheme.subtitle2,
                      ),
                      Text(
                        "Expiration: ${expirationDate(userInfo!.expDate)}",
                        style: Get.textTheme.subtitle2!.copyWith(
                          color: kColorHint,
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
          IconButton(
            focusColor: kColorFocus,
            onPressed: () {
              Get.toNamed(screenSettings);
            },
            icon: Icon(
              FontAwesomeIcons.gear,
              color: Colors.white,
              size: 19.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class CardWelcomeSetting extends StatelessWidget {
  const CardWelcomeSetting(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);
  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      focusColor: kColorFocus,
      child: Row(
        children: [
          Ink(
            width: 7.w,
            height: 7.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const RadialGradient(colors: [
                kColorCardDark,
                kColorCardLight,
              ]),
            ),
            child: Center(
              child: Icon(icon),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: Get.textTheme.headline5,
          ),
        ],
      ),
    );
  }
}

class CardWelcomeTv extends StatelessWidget {
  const CardWelcomeTv({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String icon;
  final String title;
  final String subTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      focusColor: kColorFocus,
      child: Ink(
        decoration: BoxDecoration(
          color: kColorCardLight,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 8.w,
              image: AssetImage(icon),
            ),
            SizedBox(height: 3.h),
            Text(
              title,
              style: Get.textTheme.headline3,
            ),
            SizedBox(height: 1.h),
            Text(
              "◍ $subTitle",
              style: Get.textTheme.subtitle2!.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
