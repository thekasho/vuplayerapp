part of 'helpers.dart';

const Color kColorPrimary = Color(0xFFBE7DFB);
const Color kColorPrimaryDark = Color(0xFF9E47FF);

const Color kColorFocus = Color(0xFFBE7DFB);

const Color kColorBack = Color(0xFF262435);
const Color kColorBackDark = Color(0xFF1e182c);

const Color kColorCardLight = Color(0xFF2D2A3B);
const Color kColorCardDark = Color(0xFF4C4958);
const Color kColorCardDarkness = Color(0xFF100E15);

const Color kColorHint = Color(0xFF555866);
const Color kColorHintGrey = Color(0xFF757575);
const Color kColorFontLight = Color(0xFFFFFFFF);

BoxDecoration kDecorBackground = const BoxDecoration(
  gradient: LinearGradient(
    colors: [kColorBackDark, kColorBack],
  ),
);

BoxDecoration kDecorIconCircle = const BoxDecoration(
  shape: BoxShape.circle,
  gradient: LinearGradient(
    colors: [kColorPrimaryDark, kColorPrimary],
  ),
);

/*
const Color kColorPrimary = Color(0xFFEF233C);
const Color kColorPrimaryDark = Color(0xFFB31A2D);

const Color kColorFocus = Color(0xFFD72036);

const Color kColorBack = Color(0xFF131518);
const Color kColorBackDark = Color(0xFF171A1D);

const Color kColorCardLight = Color(0xFF272B30);
const Color kColorCardDark = Color(0xFF1D2024);
const Color kColorCardDarkness = Color(0xFF131518);
 */
