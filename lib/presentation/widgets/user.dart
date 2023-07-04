part of 'widgets.dart';

class CardInputLogin extends StatelessWidget {
  const CardInputLogin(
      {Key? key, required this.hint, this.controller, this.onChange})
      : super(key: key);
  final String hint;
  final TextEditingController? controller;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Get.textTheme.subtitle2!.copyWith(
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
        style: Get.textTheme.subtitle2!.copyWith(
          color: Colors.black,
        ),
        cursorColor: kColorPrimary,
      ),
    );
  }
}
