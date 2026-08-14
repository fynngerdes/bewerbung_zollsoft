import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cv_chip_selection_provider.g.dart';

@Riverpod(keepAlive: true)
class CvChipSelection extends _$CvChipSelection {
  @override
  int build() {
    return 0;
  }

  void setSelection(int index) {
    state = index;
  }
}
