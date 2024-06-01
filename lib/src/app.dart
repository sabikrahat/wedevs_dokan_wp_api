import 'package:flutter/material.dart'
    show
        BuildContext,
        Key,
        MaterialApp,
        MediaQuery,
        TextScaler,
        ThemeData,
        Widget;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import 'config/constants.dart' show appName;
import 'config/is.under.min.size.dart';
import 'config/screen_enlarge_warning.dart';
import 'config/size.dart';
import 'localization/loalization.dart'
    show localizationsDelegates, onGenerateTitle, t;
import 'modules/home/view/home.view.dart';
import 'modules/settings/model/locale/locale.model.dart';
import 'modules/settings/model/theme/theme.model.dart';
import 'modules/settings/provider/fonts.provider.dart';
import 'modules/settings/provider/locale.provider.dart';
import 'modules/settings/provider/performance.overlay.provider.dart';
import 'modules/settings/provider/theme.provider.dart';
import 'router.dart';
import 'utils/extensions/extensions.dart';
import 'utils/logger/logger_helper.dart';

class App extends ConsumerWidget {
  const App({super.key = const Key(appName)});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: appName,
      theme: _themeData(ref),
      home: const AppRouter(),
      onGenerateTitle: onGenerateTitle,
      debugShowCheckedModeBanner: false,
      // scaffoldMessengerKey: snackbarKey,
      restorationScopeId: appName.toCamelWord,
      locale: ref.watch(localeProvider).locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      showPerformanceOverlay: ref.watch(performanceOverlayProvider),
      builder: EasyLoading.init(builder: (ctx, child) {
        t = AppLocalizations.of(ctx)!;
        topBarSize = ctx.padding.top;
        bottomViewPadding = ctx.padding.bottom;
        log.i('App build. Height: ${ctx.height} px, Width: ${ctx.width} px');
        return MediaQuery(
          data: ctx.mq.copyWith(
            devicePixelRatio: 1.0,
            textScaler: const TextScaler.linear(1.0),
          ),
          child: isUnderMinSize(ctx.mq.size)
              ? const ScreenEnlargeWarning()
              : child ?? const HomeView(),
        );
      }),
    );
  }
}

ThemeData _themeData(WidgetRef ref) {
  final t = ref.watch(themeProvider).theme;
  final f = ref.watch(fontProvider);
  return t.copyWith(
    textTheme: t.textTheme.apply(fontFamily: f),
    primaryTextTheme: t.textTheme.apply(fontFamily: f),
  );
}
