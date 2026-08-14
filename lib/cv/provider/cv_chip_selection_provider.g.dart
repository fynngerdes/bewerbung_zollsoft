// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_chip_selection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CvChipSelection)
final cvChipSelectionProvider = CvChipSelectionProvider._();

final class CvChipSelectionProvider
    extends $NotifierProvider<CvChipSelection, int> {
  CvChipSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cvChipSelectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cvChipSelectionHash();

  @$internal
  @override
  CvChipSelection create() => CvChipSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cvChipSelectionHash() => r'a6c82decdb490fc3d866d1a4162abd035b653a44';

abstract class _$CvChipSelection extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
