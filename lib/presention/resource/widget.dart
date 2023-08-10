import 'package:flutter/material.dart';

class BuildInputDecrotion extends  InputDecoration{

 late final  String lebel ;
  late String hintlebel ;
  var iconpref ;
  var iconsuffix ;
 BuildInputDecrotion(
  {lebel , hintleble , iconpref , iconsuffix}
     ){
   this.lebel=lebel;
   this.hintlebel=hintlebel;
   this.iconpref=iconpref;
   this.iconsuffix=iconsuffix;
 }
  BulidInputDecrtion(){
   return InputDecoration(
   label: Text(lebel),

   );
  }
}