// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  late final _$popupEntryAtom =
      Atom(name: '_SplashViewModelBase.popupEntry', context: context);

  @override
  OverlayEntry? get popupEntry {
    _$popupEntryAtom.reportRead();
    return super.popupEntry;
  }

  @override
  set popupEntry(OverlayEntry? value) {
    _$popupEntryAtom.reportWrite(value, super.popupEntry, () {
      super.popupEntry = value;
    });
  }

  late final _$isPopupVisibleAtom =
      Atom(name: '_SplashViewModelBase.isPopupVisible', context: context);

  @override
  bool get isPopupVisible {
    _$isPopupVisibleAtom.reportRead();
    return super.isPopupVisible;
  }

  @override
  set isPopupVisible(bool value) {
    _$isPopupVisibleAtom.reportWrite(value, super.isPopupVisible, () {
      super.isPopupVisible = value;
    });
  }

  late final _$visibilityStateAtom =
      Atom(name: '_SplashViewModelBase.visibilityState', context: context);

  @override
  bool get visibilityState {
    _$visibilityStateAtom.reportRead();
    return super.visibilityState;
  }

  @override
  set visibilityState(bool value) {
    _$visibilityStateAtom.reportWrite(value, super.visibilityState, () {
      super.visibilityState = value;
    });
  }

  late final _$_SplashViewModelBaseActionController =
      ActionController(name: '_SplashViewModelBase', context: context);

  @override
  void hidePopup() {
    final _$actionInfo = _$_SplashViewModelBaseActionController.startAction(
        name: '_SplashViewModelBase.hidePopup');
    try {
      return super.hidePopup();
    } finally {
      _$_SplashViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showPopup(BuildContext context) {
    final _$actionInfo = _$_SplashViewModelBaseActionController.startAction(
        name: '_SplashViewModelBase.showPopup');
    try {
      return super.showPopup(context);
    } finally {
      _$_SplashViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeState() {
    final _$actionInfo = _$_SplashViewModelBaseActionController.startAction(
        name: '_SplashViewModelBase.changeState');
    try {
      return super.changeState();
    } finally {
      _$_SplashViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
popupEntry: ${popupEntry},
isPopupVisible: ${isPopupVisible},
visibilityState: ${visibilityState}
    ''';
  }
}
