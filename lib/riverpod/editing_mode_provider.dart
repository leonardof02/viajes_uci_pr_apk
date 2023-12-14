import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditModeController extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  setEditing(bool editingModeIsEnabled) {
    state = editingModeIsEnabled;
  }
}

final editModeProvider =
    NotifierProvider<EditModeController, bool>(() => EditModeController());
