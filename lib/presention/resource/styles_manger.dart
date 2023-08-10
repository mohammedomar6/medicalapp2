import 'package:flutter/material.dart';

import 'font_manger.dart';


TextStyle _getTextStyle(double fontSize , FontWeight fontWeight ,Color color)
{
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle({double fontSize = FontSize.s12,required Color color})
{
  return  _getTextStyle(fontSize, FontWeightManger.regular, color);
}
TextStyle getMediumStyle({double fontSize = FontSize.s12,required Color color})
{
  return  _getTextStyle(fontSize, FontWeightManger.medium, color);
}
TextStyle getBoldStyle({double fontSize = FontSize.s12,required Color color})
{
  return  _getTextStyle(fontSize, FontWeightManger.bold, color);
}
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12,required Color color})
{
  return  _getTextStyle(fontSize, FontWeightManger.semiBold, color);
}
TextStyle getLightStyle({double fontSize = FontSize.s12,required Color color})
{
  return  _getTextStyle(fontSize, FontWeightManger.light, color);
}