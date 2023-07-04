part of '../screens.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        width: 100.w,
        height: 100.h,
        decoration: kDecorBackground,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              final userInfo = state.user;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarSettings(),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kColorCardLight,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        dateNowWelcome(),
                                        style: Get.textTheme.subtitle2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Expiration: ${expirationDate(userInfo.userInfo!.expDate)}",
                                        style:
                                            Get.textTheme.subtitle2!.copyWith(
                                          color: kColorHint,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kColorCardLight,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "name: ${userInfo.userInfo!.username}",
                                        style: Get.textTheme.subtitle2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "password: ${userInfo.userInfo!.password}",
                                        style: Get.textTheme.subtitle2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Url: ${userInfo.serverInfo!.serverUrl}",
                                        style: Get.textTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30.w,
                                child: CardButtonWatchMovie(
                                  isFocused: true,
                                  title: "Add New User",
                                  onTap: () {
                                    context.read<AuthBloc>().add(AuthLogOut());
                                    Get.offAllNamed("/");
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              SizedBox(
                                width: 30.w,
                                child: CardButtonWatchMovie(
                                  title: "LogOut",
                                  onTap: () {
                                    context.read<AuthBloc>().add(AuthLogOut());
                                    Get.offAllNamed("/");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CreatedBy:',
                        style: Get.textTheme.subtitle2!.copyWith(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchUrlString(
                            "https://facebook.com/mkasho",
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Text(
                          ' @Mustafa Kasho',
                          style: Get.textTheme.subtitle2!.copyWith(
                            fontSize: 12.sp,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
