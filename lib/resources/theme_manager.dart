import 'package:flutter/material.dart';

import 'resources.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

      // main colors of the app
      scaffoldBackgroundColor: ColorManager.white,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primary),
      useMaterial3: true,
      primaryColor: ColorManager.primary,
      disabledColor: ColorManager.grey,

      // ripple color
      splashColor: ColorManager.primaryOpacity70,

      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.black,
          elevation: AppSize.s4,
          shadowColor: Colors.blue.withOpacity(0.7),
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s18)),

      // Button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey,
          buttonColor: ColorManager.white,
          splashColor: ColorManager.white),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              // primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),
      listTileTheme: ListTileThemeData(
          titleTextStyle: getBoldStyle(
              color: ColorManager.primary, fontSize: FontSize.s17)),
      // Text theme
      textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16),
          displayMedium: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16),
          displaySmall:
              getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
          headlineMedium: getRegularStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          titleMedium: getMediumStyle(
              color: ColorManager.lightGrey, fontSize: FontSize.s14),
          titleSmall: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          bodyMedium: getMediumStyle(color: ColorManager.lightGrey),
          bodySmall: getRegularStyle(color: ColorManager.grey),
          bodyLarge: getRegularStyle(color: ColorManager.grey)),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}
