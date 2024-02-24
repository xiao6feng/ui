import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/colors.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'src/encoder.dart';

part 'theme.tailor.dart';

typedef ComponentWidgetBuilder = Widget Function();

@Tailor(
  themes: ['baseTheme'],
  themeGetter: ThemeGetter.none,
)
@IntEncoder()
class _$AppTheme {
  static List<AppBarTheme> appBarTheme = [AppBarTheme.baseTheme];
  static List<AppSearchBarTheme> appSearchBarTheme = [
    AppSearchBarTheme.baseTheme
  ];

  static List<DialogTheme> dialogTheme = [DialogTheme.baseTheme];
  static List<ButtonTheme> buttonTheme = [ButtonTheme.baseTheme];
  static List<IconTheme> iconTheme = [IconTheme.baseTheme];
  static List<TextTheme> textTheme = [TextTheme.baseTheme];
  static List<AvatarTheme> avatarTheme = [AvatarTheme.baseTheme];
  static List<BadgeTheme> badgeTheme = [BadgeTheme.baseTheme];
  static List<RadioTheme> radioTheme = [RadioTheme.baseTheme];
  static List<SwitchTheme> switchTheme = [SwitchTheme.baseTheme];
  static List<TabBarTheme> tabBarTheme = [TabBarTheme.baseTheme];
  static List<UploadTheme> uploadTheme = [UploadTheme.baseTheme];
  static List<TextFieldTheme> textFieldTheme = [TextFieldTheme.baseTheme];
  static List<PhotoViewTheme> photoViewTheme = [PhotoViewTheme.baseTheme];
  static List<PopupMenuButtonTheme> popupMenuButtonTheme = [
    PopupMenuButtonTheme.baseTheme
  ];
  static List<DropdownButtonTheme> dropdownButtonTheme = [
    DropdownButtonTheme.baseTheme
  ];
  static List<SearchTagTheme> searchTagTheme = [SearchTagTheme.baseTheme];

  static List<IntroViewTheme> introViewTheme = [IntroViewTheme.baseTheme];

  static List<TableTheme> tableTheme = [TableTheme.baseTheme];
  static List<PopupMenuTheme> popupMenuTheme = [PopupMenuTheme.baseTheme];

  static List<ListTileTheme> listTileTheme = [ListTileTheme.baseTheme];
  static List<DatePickerTheme> datePickerTheme = [DatePickerTheme.baseTheme];

  static List<DateRangePickerTheme> dateRangePickerTheme = [
    DateRangePickerTheme.baseTheme
  ];

  static List<PickerTheme> pickerTheme = [PickerTheme.baseTheme];
  static List<AddressPickerTheme> addressPickerTheme = [
    AddressPickerTheme.baseTheme
  ];
  static List<ToastTheme> toastTheme = [ToastTheme.baseTheme];
}

@TailorComponent(themes: ['baseTheme'])
@IntEncoder()
class _$AppBarTheme {
  static List<Color?> backgroundColor = [AppColors.backgroundColor];
  static List<Color?> foregroundColor = [null];

  static List<ComponentWidgetBuilder?> leadIconBuilder = [null];
  static List<TextStyle?> titleStyle = [
    const TextStyle(
        color: AppColors.titleColor, fontWeight: FontWeight.w500, fontSize: 16)
  ];
  static List<TextStyle?> actionsStyle = [
    const TextStyle(
        color: AppColors.subtitleColor,
        fontWeight: FontWeight.w400,
        fontSize: 14)
  ];
  static List<SystemUiOverlayStyle?> systemUiOverlayStyle = [
    SystemUiOverlayStyle.dark
  ];
  static List<Color?> shadowColor = [null];

  static List<IconThemeData?> iconTheme = [null];

  static List<IconThemeData?> actionsIconTheme = [null];
}

@TailorComponent(themes: ['baseTheme'])
class _$AppSearchBarTheme {
  static List<Widget> actions = [
    Container(
      width: 76,
      height: 36,
      alignment: Alignment.center,
      child: const Text(
        '搜索',
        style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
    )
  ];

  static List<Widget> prefixIcon = [
    Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 12.0),
      child: Image.asset(
        'assets/images/icon/com_search.png',
        width: 16,
        height: 16,
        package: 'component',
      ),
    ),
  ];

  static List<double> textFieldHeight = [36.0];

  static List<AppBarTheme> appBarTheme = [AppBarTheme.baseTheme];
  static List<TextFieldTheme> textFieldTheme = [TextFieldTheme.baseTheme];
}

@TailorComponent(themes: ['baseTheme'])
@IntEncoder()
@DoubleEncoder()
@EdgeInsetsEncoder()
class _$DialogTheme {
  static List<EdgeInsets> insetPadding = [
    const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16)
  ];

  static List<ShapeBorder?> shape = [null];

  static List<Color> backgroundColor = const [AppColors.dialogBackgroundColor];

  static List<TextStyle> titleTextStyle = [
    const TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    )
  ];

  static List<TextStyle> contentTextStyle = [
    const TextStyle(
      color: AppColors.subtitleColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    )
  ];

  static List<TextStyle> optionTextStyle = [
    const TextStyle(
      color: AppColors.placeholderColor,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    )
  ];
}

@TailorComponent(themes: ['baseTheme'])
@IntEncoder()
class _$ButtonTheme {
  static List<double> largeButtonRadius = [20];
  static List<double> largeButtonHeight = [40];
  static List<double> largeButtonFontSize = [16];

  static List<double> middleButtonRadius = [16];
  static List<double> middleButtonFontSize = [14];
  static List<double> middleButtonHeight = [32];

  static List<double> smallButtonRadius = [14];
  static List<double> smallButtonFontSize = [12];
  static List<double> smallButtonHeight = [28];

  //默认null 即 高度的一半；
  static List<double?> radius = [null];

  static List<Color> primaryGradientColorA = [AppColors.primaryGradientColorA];
  static List<Color> primaryGradientColorB = [AppColors.primaryGradientColorB];
  static List<TextStyle> middleTitleStyle = [
    const TextStyle(fontSize: 14, color: AppColors.decorateColor)
  ];

  static List<Gradient?> primaryGradient = [null];
  static List<Gradient?> secondaryGradient = [null];

  static List<TextTheme> textTheme = [TextTheme.baseTheme];

  static List<Color> largeButtonFillColor = const [Color(0x52ffffff)];
  static List<Color> middleButtonFillColor = const [Color(0x0fffffff)];
  static List<Color> smallButtonFillColor = const [Color(0x0fffffff)];

  static List<Color> pressedColor = [AppColors.buttonPressedColor];

  static List<TextStyle> buttonTextStyle = [
    const TextStyle(
        color: AppColors.titleColor, fontWeight: FontWeight.w400, fontSize: 16)
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$AvatarTheme {
  static List<Color> backgroundColor = [AppColors.backgroundColor];

  static List<TextStyle?> textStyle = [null];
}

@TailorComponent(themes: ['baseTheme'])
class _$BadgeTheme {
  static List<BoxConstraints> countConstraints = const [
    BoxConstraints.tightFor(width: 14, height: 14)
  ];
  static List<TextStyle> countTextStyle = const [
    TextStyle(fontSize: 10, color: Colors.white)
  ];
  static List<BoxConstraints> dotConstraints = const [
    BoxConstraints.tightFor(width: 8, height: 8)
  ];
  static List<Color> badgeColor = const [Color(0xffFF5722)];
  static List<Border> dotBorder = const [
    Border.fromBorderSide(
      BorderSide(
        color: Colors.white,
      ),
    )
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$RadioTheme {
  static List<double> radioHeight = const [16];
  static List<Color> radioColor = [AppColors.subtitleColor];
  static List<Color> radioColorOn = [AppColors.primaryColor];

  static List<EdgeInsets> containerPadding = const [EdgeInsets.all(2)];
}

@TailorComponent(themes: ['baseTheme'])
class _$SwitchTheme {
  static List<double> width = const [40.0];
  static List<double> height = const [24.0];
  static List<double> border = const [3.0];

  static List<Color> backgroundColor = [AppColors.divider10Color];
  static List<Color> backgroundColorOn = [AppColors.primaryColor];

  static List<Color> borderColor = [AppColors.subtitleColor];
  static List<Color> borderColorOn = [AppColors.primaryColor.withOpacity(0.6)];

  static List<Color> dotColor = [Colors.white];
  static List<Color> dotColorOn1 = [AppColors.primaryGradientColorA];
  static List<Color> dotColorOn2 = [AppColors.primaryGradientColorB];

  static List<Duration> duration = const [Duration(milliseconds: 200)];
}

@TailorComponent(themes: ['baseTheme'])
class _$TabBarTheme {
  static List<double> iconSize = const [24.0];

  static List<Color> labelColor = const [AppColors.primaryColor];
  static List<Color> unselectedLabelColor = const [AppColors.subtitleColor];

  static List<TextStyle> labelStyle = const [
    TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 14)
  ];

  static List<TextStyle> unselectedLabelStyle = const [
    TextStyle(
        color: AppColors.subtitleColor,
        fontWeight: FontWeight.w400,
        fontSize: 14)
  ];

  static List<Decoration?> indicator = [null];
  static List<Color> indicatorColor = [AppColors.primaryColor];

  static List<TabBarIndicatorSize?> indicatorSize = [null];

  static List<EdgeInsets?> labelPadding = [null];
}

@TailorComponent(themes: ['baseTheme'])
class _$UploadTheme {
  static List<double> imageSize = const [72.0];
  static List<double> imageRadius = const [8.0];
  static List<double> addImageSize = const [24.0];
  static List<double> deleteImageSize = const [12.0];
  static List<TextStyle> tagStyle = const [
    TextStyle(
        color: AppColors.subtitleColor,
        fontWeight: FontWeight.w400,
        fontSize: 12)
  ];
  static List<TextStyle> uploadTextStyle = const [
    TextStyle(fontSize: 12, color: AppColors.titleColor),
  ];

  static List<Color> backgroundColor = const [AppColors.dialogBackgroundColor];
  static List<Color> progressColor = const [AppColors.placeholderColor];
  static List<double> progressHeight = const [3.0];
}

@TailorComponent(themes: ['baseTheme'])
class _$TextFieldTheme {
  static List<TextStyle> style = const [
    TextStyle(
      fontSize: 16,
      color: AppColors.titleColor,
      fontWeight: FontWeight.w400,
    ),
  ];

  static List<TextStyle> hintStyle = const [
    TextStyle(
      fontSize: 16,
      color: AppColors.placeholderColor,
      fontWeight: FontWeight.w400,
    ),
  ];

  static List<TextStyle> errorStyle = const [
    TextStyle(
      fontSize: 12.0,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w400,
    ),
  ];

  static List<Color> cursorColor = const [Color(0xFFFF5722)];
}

@TailorComponent(themes: ['baseTheme'])
class _$PhotoViewTheme {
  static List<Widget> barBack = [
    Image.asset(
      'assets/images/icon/back.png',
      package: 'component',
      width: 30,
      height: 30,
    ),
  ];
  static List<EdgeInsets> barItemPadding = const [
    EdgeInsets.symmetric(horizontal: 10)
  ];
  static List<TextStyle> indexIndicatorStyle = const [
    TextStyle(
      color: Colors.white,
      fontSize: 17.0,
    ),
  ];

  static List<BoxDecoration> backgroundDecoration = const [
    BoxDecoration(
      color: Colors.black,
    ),
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$IconTheme {
  static List<Size> size16 = const [Size(16, 16)];
  static List<Size> size24 = const [Size(24, 24)];
  static List<Size> size32 = const [Size(32, 23)];
  static List<Size> size40 = const [Size(40, 40)];
  static List<Size> size48 = const [Size(48, 48)];
  static List<Size> size56 = const [Size(56, 56)];
  static List<Size> size64 = const [Size(64, 64)];
  static List<Size> size72 = const [Size(72, 72)];
}

@TailorComponent(themes: ['baseTheme'])
class _$TextTheme {
  static List<Color> titleColor = [AppColors.titleColor];
  static List<Color> subtitleColor = [AppColors.subtitleColor];
  static List<Color> placeholderColor = [AppColors.placeholderColor];

  static List<double> font18 = [18];
  static List<double> font16 = [16];
  static List<double> font14 = [14];
  static List<double> font12 = [12];
  static List<double> font10 = [10];

  static List<FontWeight> fontWeightMedium = [FontWeight.w500];
  static List<FontWeight> fontWeightRegular = [FontWeight.w400];

  static List<TextStyle> titleStyle = [
    const TextStyle(
        fontSize: 18, color: AppColors.titleColor, fontWeight: FontWeight.w500)
  ];
  static List<TextStyle> subtitleStyle = [
    const TextStyle(
        fontSize: 14,
        color: AppColors.subtitleColor,
        fontWeight: FontWeight.w400)
  ];
  static List<TextStyle> placeholderStyle = [
    const TextStyle(
        fontSize: 12,
        color: AppColors.placeholderColor,
        fontWeight: FontWeight.w400)
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$PopupMenuButtonTheme {
  static List<Color?> shadowColor = [null];
  static List<Color> surfaceTintColor = [AppColors.primaryColor];
  static List<Color> color = [AppColors.cardBackgroundColor];

  static List<double> elevation = [5];
  static List<double?> splashRadius = [null];

  static List<EdgeInsets> padding = const [EdgeInsets.all(8)];

  static List<TextStyle> titleStyle = [
    const TextStyle(
        fontSize: 18, color: AppColors.titleColor, fontWeight: FontWeight.w500)
  ];

  static List<ShapeBorder> shape = [
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$DropdownButtonTheme {
  static List<Color?> focusColor = [null];
  static List<Color> dropdownColor = [AppColors.backgroundColor];

  static List<int> elevation = [8];
  static List<double> itemHeight = [kMinInteractiveDimension];
  static List<double> menuMaxHeight = [300];

  static List<EdgeInsets> padding = const [EdgeInsets.all(8)];

  static List<TextStyle> style = [
    const TextStyle(
        fontSize: 18, color: AppColors.titleColor, fontWeight: FontWeight.w500)
  ];

  static List<BorderRadius> borderRadius = [BorderRadius.circular(12)];

  static List<Widget> underline = [SizedBox()];
}

@TailorComponent(themes: ['baseTheme'])
class _$SearchTagTheme {
  static List<Color> tagBackgroundColor = [AppColors.cardBackgroundColor];

  static List<double> tagRadius = [16];
  static List<double> runSpacing = [12];
  static List<double> spacing = [12];

  static List<EdgeInsets> titlePadding = const [EdgeInsets.only(bottom: 12)];
  static List<EdgeInsets> tagPadding = const [
    EdgeInsets.symmetric(horizontal: 16, vertical: 8)
  ];

  static List<TextStyle> titleStyle = [
    const TextStyle(
        fontSize: 14, color: AppColors.titleColor, fontWeight: FontWeight.w500)
  ];
  static List<TextStyle> tagStyle = [
    const TextStyle(
        fontSize: 12,
        color: AppColors.subtitleColor,
        fontWeight: FontWeight.w400)
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$IntroViewTheme {
  static List<Color> normalColor = [AppColors.progressValueColor];
  static List<Color> selectedColor = [AppColors.primaryColor];

  static List<Size> dotSize = const [Size(10, 10)];
  static List<double> spacing = [8];
}

typedef TableColorFunc = Color? Function(int column);
typedef TableCellTextStyleFunc = TextStyle Function(int column, int row);

@TailorComponent(themes: ['baseTheme'])
class _$TableTheme {
  static List<TableColorFunc> columnColorFunc = [
    (column) {
      Color? backgrundColor;

      switch (column) {
        case 0:
          backgrundColor = const Color(0x1aE1A100);
          break;
        case 2:
          backgrundColor = const Color(0x1aFF5722);
          break;
        default:
      }
      return backgrundColor;
    }
  ];

  static List<TableColorFunc> rowColorFunc = [
    (row) {
      return row.isEven ? null : const Color(0x0aFFFFFF);
    }
  ];
  static List<TableCellTextStyleFunc> cellTextStyleFunc = [
    (column, row) {
      Color textColor = Colors.white;

      switch (column) {
        case 0:
          textColor = AppColors.decorateColor;
          break;
        case 2:
          textColor = AppColors.primaryColor;
          break;
        default:
      }
      return TextStyle(color: textColor, fontSize: 14);
    }
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$PopupMenuTheme {
  static List<Color> arrowColor = [const Color(0xFF4C4C4C)];
  static List<bool> showArrow = [true];
  static List<Color> barrierColor = [Colors.black12];
  static List<double> arrowSize = [10];
  static List<double> horizontalMargin = [10];
  static List<double> verticalMargin = [10];
}

@TailorComponent(themes: ['baseTheme'])
class _$ListTileTheme {
  static List<TextStyle> titleTextStyle = const [
    TextStyle(
        color: AppColors.titleColor, fontSize: 14, fontWeight: FontWeight.w400)
  ];
  static List<TextStyle> subtitleTextStyle = const [
    TextStyle(
        color: AppColors.subtitleColor,
        fontSize: 12,
        fontWeight: FontWeight.w400)
  ];

  static List<TextStyle> leadingAndTrailingTextStyle = const [
    TextStyle(
        color: AppColors.subtitleColor,
        fontSize: 12,
        fontWeight: FontWeight.w400)
  ];

  static List<EdgeInsetsGeometry> contentPadding = const [
    EdgeInsets.symmetric(horizontal: 16)
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$DatePickerTheme {
  static List<double> itemExtent = const [32.0];
  static List<double> pickerWidth = const [320.0];
  static List<double> pickerHeight = const [216.0];
  static List<bool> useMagnifier = const [true];
  static List<double> magnification = const [2.35 / 2.1];
  static List<double> datePickerPadSize = const [36.0];
  static List<double> squeeze = const [1.25];

  static List<TextStyle> defaultPickerTextStyle = const [
    TextStyle(
      letterSpacing: -0.83,
    )
  ];
  static List<double> timerPickerMagnification = [34 / 32];
  static List<double> timerPickerMinHorizontalPadding = [30];
  static List<double> timerPickerHalfColumnPadding = [4];
  static List<double> timerPickerLabelPadSize = [6];
  static List<double> timerPickerLabelFontSize = [17];
  static List<double> timerPickerColumnIntrinsicWidth = [106];

  static List<TextStyle> validTextStyle = const [
    TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.titleColor,
    )
  ];
  static List<TextStyle> invalidTextStyle = const [
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.subtitleColor,
    )
  ];
  static List<Color> backgroundColor = [AppColors.dialogBackgroundColor];
  static List<Color> dateRangeTextColor = [AppColors.decorateColor];
}

@TailorComponent(themes: ['baseTheme'])
class _$DateRangePickerTheme {
  static List<TextStyle> fromFocusStyle = const [
    TextStyle(
        color: AppColors.decorateColor,
        fontSize: 14,
        fontWeight: FontWeight.w400)
  ];

  static List<TextStyle> fromStyle = const [
    TextStyle(
        color: AppColors.titleColor, fontSize: 14, fontWeight: FontWeight.w400)
  ];
  static List<double> fromAndToHeight = const [40.0];

  static List<EdgeInsets> fromAndToMargin = const [
    EdgeInsets.symmetric(horizontal: 16, vertical: 24)
  ];
  static List<double> centelSpace = const [24.0];

  static List<Widget> centelWidget = const [
    Text(
      '至',
      style: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    )
  ];

  static List<TextStyle> hintStyle = const [
    TextStyle(
        color: AppColors.subtitleColor,
        fontSize: 14,
        fontWeight: FontWeight.w400)
  ];

  static List<InputBorder> border = const [
    OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(width: 0, style: BorderStyle.none)),
  ];

  static List<Color> fillColor = [Colors.white.withOpacity(0.04)];
  static List<Color> fillColorFocus = [
    AppColors.decorateColor.withOpacity(0.06)
  ];
}

@TailorComponent(themes: ['baseTheme'])
class _$AddressPickerTheme {
  static List<TextStyle> cityStyle = const [
    TextStyle(
        color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.w500)
  ];
  static List<double> itemExtent = const [40.0];
}

@TailorComponent(themes: ['baseTheme'])
class _$PickerTheme {
  static List<Color> pickerSelectionOverlayColor = const [
    AppColors.cardBackgroundColor
  ];
  static List<BoxBorder> pickerSelectionOverlayBorder = const [
    Border(
      top: BorderSide(
          color: Color(0x0fffffff), width: 1, style: BorderStyle.solid),
      bottom: BorderSide(
          color: Color(0x0fffffff), width: 1, style: BorderStyle.solid),
    ),
  ];

  static List<Color> titleBackground = const [AppColors.cardBackgroundColor];
  static List<double> titleHeight = const [44.0];

  static List<EdgeInsets> titlePadding = const [
    EdgeInsets.symmetric(horizontal: 16)
  ];

  static List<TextStyle> titleCancelStyle = const [
    TextStyle(
        color: AppColors.subtitleColor,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ];

  static List<TextStyle> titleConfirmStyle = const [
    TextStyle(
        color: AppColors.subtitleColor,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ];

  static List<ShapeBorder> shape = const [
    RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)))
  ];
  static List<Color> backgroundColor = const [AppColors.dialogBackgroundColor];
  static List<double> maxPickerHeight = const [340.0];
}

@TailorComponent(themes: ['baseTheme'])
class _$ToastTheme {
  static List<Decoration> loadingDecoration = [
    const BoxDecoration(
      color: Color(0xCC000000),
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border:
          Border.fromBorderSide(BorderSide(color: Color(0x51FFFFFF), width: 1)),
    )
  ];
  static List<Decoration> textDecoration = [
    const ShapeDecoration(
      shape:
          StadiumBorder(side: BorderSide(color: Color(0x33ffffff), width: 1)),
      color: Color(0x66000000),
    )
  ];
  static List<Decoration> successDecoration = [
    const BoxDecoration(
      color: Color(0xCC000000),
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border:
          Border.fromBorderSide(BorderSide(color: Color(0x33ffffff), width: 1)),
    )
  ];
  static List<Decoration> errorDecoration = [
    const BoxDecoration(
      color: Color(0xCC000000),
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border:
          Border.fromBorderSide(BorderSide(color: Color(0x33ffffff), width: 1)),
    )
  ];
}
