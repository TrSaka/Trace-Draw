// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DrawViewModel on _DrawViewModelBase, Store {
  late final _$containerTopAtom =
      Atom(name: '_DrawViewModelBase.containerTop', context: context);

  @override
  double get containerTop {
    _$containerTopAtom.reportRead();
    return super.containerTop;
  }

  @override
  set containerTop(double value) {
    _$containerTopAtom.reportWrite(value, super.containerTop, () {
      super.containerTop = value;
    });
  }

  late final _$containerLeftAtom =
      Atom(name: '_DrawViewModelBase.containerLeft', context: context);

  @override
  double get containerLeft {
    _$containerLeftAtom.reportRead();
    return super.containerLeft;
  }

  @override
  set containerLeft(double value) {
    _$containerLeftAtom.reportWrite(value, super.containerLeft, () {
      super.containerLeft = value;
    });
  }

  late final _$containerHeightAtom =
      Atom(name: '_DrawViewModelBase.containerHeight', context: context);

  @override
  double get containerHeight {
    _$containerHeightAtom.reportRead();
    return super.containerHeight;
  }

  @override
  set containerHeight(double value) {
    _$containerHeightAtom.reportWrite(value, super.containerHeight, () {
      super.containerHeight = value;
    });
  }

  late final _$containerWidthAtom =
      Atom(name: '_DrawViewModelBase.containerWidth', context: context);

  @override
  double get containerWidth {
    _$containerWidthAtom.reportRead();
    return super.containerWidth;
  }

  @override
  set containerWidth(double value) {
    _$containerWidthAtom.reportWrite(value, super.containerWidth, () {
      super.containerWidth = value;
    });
  }

  late final _$_DrawViewModelBaseActionController =
      ActionController(name: '_DrawViewModelBase', context: context);

  @override
  dynamic dragContainer(dynamic deltaX, dynamic deltaY) {
    final _$actionInfo = _$_DrawViewModelBaseActionController.startAction(
        name: '_DrawViewModelBase.dragContainer');
    try {
      return super.dragContainer(deltaX, deltaY);
    } finally {
      _$_DrawViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resizeContainer(dynamic scale) {
    final _$actionInfo = _$_DrawViewModelBaseActionController.startAction(
        name: '_DrawViewModelBase.resizeContainer');
    try {
      return super.resizeContainer(scale);
    } finally {
      _$_DrawViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetContainer() {
    final _$actionInfo = _$_DrawViewModelBaseActionController.startAction(
        name: '_DrawViewModelBase.resetContainer');
    try {
      return super.resetContainer();
    } finally {
      _$_DrawViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
containerTop: ${containerTop},
containerLeft: ${containerLeft},
containerHeight: ${containerHeight},
containerWidth: ${containerWidth}
    ''';
  }
}
