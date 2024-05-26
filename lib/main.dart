import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mlosafi/common/router/stateful_shell.dart';
import 'package:mlosafi/common/utils/bloc_observer.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/add-to-cart/Presentation/bloc/add_to_cart_bloc.dart';
import 'package:mlosafi/features/delete-cart-Item/presentation/bloc/delete_cart_item_bloc.dart';
import 'package:mlosafi/features/get-all-foods/Presentation/bloc/get_all_foods_bloc.dart';
import 'package:mlosafi/features/get-cart-items/Presentation/bloc/cart_data_bloc.dart';
import 'package:mlosafi/features/login/presentation/bloc/login_bloc.dart';
import 'package:mlosafi/features/signup/presentation/bloc/sign_up_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = AppGlobalBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LoginBloc>(),
        ),
        BlocProvider(create: (_) => getIt<SignUpBloc>()),
        BlocProvider(create: (_) => getIt<GetAllFoodsBloc>()),
        BlocProvider(create: (_) => getIt<AddToCartBloc>()),
        BlocProvider(create: (_) => getIt<CartDataBloc>()),
        BlocProvider(create: (_) => DeleteCartItemBloc())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(
          colors: const FlexSchemeColor(
            primary: Color(0xff4caf50),
            primaryContainer: Color(0xffffdbcb),
            secondary: Color(0xffffeb3b),
            secondaryContainer: Color(0xfff58d1d),
            tertiary: Color(0xff4169e1),
            tertiaryContainer: Color(0xff52555a),
            appBarColor: Color(0xfff58d1d),
            error: Color(0xffb00020),
          ),
          appBarStyle: FlexAppBarStyle.surface,
          subThemesData: const FlexSubThemesData(
            interactionEffects: false,
            tintedDisabledControls: false,
            blendOnColors: false,
            useTextTheme: true,
            inputDecoratorBorderType: FlexInputBorderType.underline,
            inputDecoratorUnfocusedBorderIsColored: false,
            alignedDropdown: true,
            tooltipRadius: 4,
            tooltipSchemeColor: SchemeColor.inverseSurface,
            tooltipOpacity: 0.9,
            useInputDecoratorThemeInDialogs: true,
            snackBarElevation: 6,
            snackBarBackgroundSchemeColor: SchemeColor.onPrimaryContainer,
            snackBarActionSchemeColor: SchemeColor.primary,
            navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
            navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
            navigationBarMutedUnselectedLabel: false,
            navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
            navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
            navigationBarMutedUnselectedIcon: false,
            navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
            navigationBarIndicatorOpacity: 1.00,
            navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
            navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
            navigationRailMutedUnselectedLabel: false,
            navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
            navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
            navigationRailMutedUnselectedIcon: false,
            navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
            navigationRailIndicatorOpacity: 1.00,
            navigationRailBackgroundSchemeColor: SchemeColor.surface,
            navigationRailLabelType: NavigationRailLabelType.none,
          ),
          keyColors: const FlexKeyColors(
            useSecondary: true,
            useTertiary: true,
            keepPrimary: true,
            keepSecondary: true,
            keepTertiary: true,
          ),
          tones: FlexTones.jolly(Brightness.light),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: Color(0xff4caf50),
            primaryContainer: Color(0xff005313),
            secondary: Color(0xffffeb3b),
            secondaryContainer: Color(0xff872100),
            tertiary: Color(0xff4169e1),
            tertiaryContainer: Color(0xff52555a),
            appBarColor: Color(0xff872100),
            error: Color(0xffcf6679),
          ),
          subThemesData: const FlexSubThemesData(
            interactionEffects: false,
            tintedDisabledControls: false,
            useTextTheme: true,
            inputDecoratorBorderType: FlexInputBorderType.underline,
            inputDecoratorUnfocusedBorderIsColored: false,
            alignedDropdown: true,
            tooltipRadius: 4,
            tooltipSchemeColor: SchemeColor.inverseSurface,
            tooltipOpacity: 0.9,
            useInputDecoratorThemeInDialogs: true,
            snackBarElevation: 6,
            snackBarBackgroundSchemeColor: SchemeColor.onPrimaryContainer,
            snackBarActionSchemeColor: SchemeColor.primary,
            navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
            navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
            navigationBarMutedUnselectedLabel: false,
            navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
            navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
            navigationBarMutedUnselectedIcon: false,
            navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
            navigationBarIndicatorOpacity: 1.00,
            navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
            navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
            navigationRailMutedUnselectedLabel: false,
            navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
            navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
            navigationRailMutedUnselectedIcon: false,
            navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
            navigationRailIndicatorOpacity: 1.00,
            navigationRailBackgroundSchemeColor: SchemeColor.surface,
            navigationRailLabelType: NavigationRailLabelType.none,
          ),
          keyColors: const FlexKeyColors(
            useSecondary: true,
            useTertiary: true,
            keepPrimary: true,
            keepSecondary: true,
            keepTertiary: true,
          ),
          tones: FlexTones.jolly(Brightness.dark),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        themeMode: ThemeMode.system,
        //routerConfig: AppRouter.router,
        routerConfig: goRouter,
      ),
    );
  }
}
