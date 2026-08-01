// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(theme)
final themeProvider = ThemeFamily._();

final class ThemeProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  ThemeProvider._({
    required ThemeFamily super.from,
    required Brightness super.argument,
  }) : super(
         retry: null,
         name: r'themeProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$themeHash();

  @override
  String toString() {
    return r'themeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    final argument = this.argument as Brightness;
    return theme(ref, brightness: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ThemeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$themeHash() => r'45741fd65369ddc7f874690075706a1cc76df3bb';

final class ThemeFamily extends $Family
    with $FunctionalFamilyOverride<ThemeData, Brightness> {
  ThemeFamily._()
    : super(
        retry: null,
        name: r'themeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ThemeProvider call({required Brightness brightness}) =>
      ThemeProvider._(argument: brightness, from: this);

  @override
  String toString() => r'themeProvider';
}

@ProviderFor(SwitchThemeMode)
final switchThemeModeProvider = SwitchThemeModeProvider._();

final class SwitchThemeModeProvider
    extends $NotifierProvider<SwitchThemeMode, ThemeMode> {
  SwitchThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'switchThemeModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$switchThemeModeHash();

  @$internal
  @override
  SwitchThemeMode create() => SwitchThemeMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$switchThemeModeHash() => r'515dc9e3cde60fec64a0064d32e5fba150b40496';

abstract class _$SwitchThemeMode extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
