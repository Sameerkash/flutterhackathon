import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double textScaleFactor;

  /// Refrence device height
  final double baseHeight = 812.0;
  final double baseWidth = 375.0;

  /// Screen height and width ratio
  static double scaleHeightRatio;
  static double scaledWidthRatio;

  static double safeHeight;
  static double safeWidth;

  void init(BuildContext context,{ Constraints constraints}) {
    _mediaQueryData = MediaQuery.of(context);
    // Device Screen width  and height
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    /// Aspect ration of the device with respect to test device
    scaleHeightRatio = screenHeight / baseHeight;
    scaledWidthRatio = screenWidth / baseWidth;

    ///textScaleFactor for the device
    textScaleFactor = _mediaQueryData.textScaleFactor;

    /// Indivudal  block size of each pixel
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeWidth = (screenWidth - _safeAreaHorizontal);
    safeHeight = (screenHeight - _safeAreaVertical);

    /// Safe Heigth and width considering padding and app bar size
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  /// safe height sacling on ratio
  // static double sacleHeightSafe(double actualHeight) {
  //   return (actualHeight * scaleHeightRatio) - safeHeight;
  // }

  /// safe width sacling on ratio
  // static double scalewidthsafe(double actaulWidth) {
  //   return (actaulWidth * scaleHeightRatio) - safeWidth;
  // }

  // /// Method to scale the height of a widget
  // static double scaleHeight(double actulaHeight) {
  //   return actulaHeight * scaleHeightRatio;
  // }

  /// Method to scale the width of a widget
  // static double scaledWidth(double actaulWidth) {
    // return actaulWidth * scaledWidthRatio;
  // }

  ///Method to scale the text
  static double scaleText(double actaulSize) {
    return actaulSize * scaledWidthRatio * textScaleFactor;
  }
}
