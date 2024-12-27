import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialTechbizTheme {
  MaterialTechbizTheme();

  /// ปรับธีมแล้วเอาโค้ดมาจากเว็บนี้
  /// https://rydmike.com/flexcolorscheme/themesplayground-latest/
  ///
  /// ห้ามปรับเอง (เดี๋ยวจะพัง!)
  ThemeData get themeData => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff56a43e),
          primaryContainer: Color(0xffe5e5e5),
          secondary: Color(0xff4eb92d),
          secondaryContainer: Color(0xff235314),
          tertiary: Color(0xff006875),
          tertiaryContainer: Color.fromARGB(255, 219, 247, 213),
          appBarColor: Color(0xff235314),
          error: Color(0xffb00020),
          errorContainer: Color.fromARGB(255, 247, 213, 213),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 40,
        surface: Colors.white,
        scaffoldBackground: Colors.white,
        subThemesData: const FlexSubThemesData(
          interactionEffects: false,
          tintedDisabledControls: false,
          blendOnLevel: 28,
          blendOnColors: false,
          useMaterial3Typography: true,
          adaptiveSplash: FlexAdaptive.all(),
          splashType: FlexSplashType.instantSplash,
          splashTypeAdaptive: FlexSplashType.defaultSplash,
          defaultRadius: 13.0,
          adaptiveRadius: FlexAdaptive.all(),
          textButtonRadius: 10.0,
          textButtonSchemeColor: SchemeColor.onPrimary,
          elevatedButtonSchemeColor: SchemeColor.tertiary,
          elevatedButtonSecondarySchemeColor: SchemeColor.onTertiary,
          outlinedButtonSchemeColor: SchemeColor.onPrimary,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          segmentedButtonSchemeColor: SchemeColor.primaryContainer,
          switchSchemeColor: SchemeColor.primary,
          switchThumbSchemeColor: SchemeColor.tertiary,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedBorderIsColored: false,
          fabUseShape: true,
          fabSchemeColor: SchemeColor.primaryContainer,
          alignedDropdown: true,
          tooltipRadius: 4,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          tooltipOpacity: 0.9,
          useInputDecoratorThemeInDialogs: true,
          snackBarElevation: 6,
          snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
          tabBarItemSchemeColor: SchemeColor.onPrimaryContainer,
          drawerIndicatorSchemeColor: SchemeColor.primaryContainer,
          navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.primaryContainer,
          navigationRailIndicatorOpacity: 1.00,
          navigationRailBackgroundSchemeColor: SchemeColor.surface,
          navigationRailLabelType: NavigationRailLabelType.none,
        ),

        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w200,
          ),
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        typography: Typography.material2021(),
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSansThai.toString(),
      );
}
