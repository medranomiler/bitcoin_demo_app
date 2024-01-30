// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:bitcoin_demo_app/ui/views/buy/custom_text_field.dart';
import 'package:bitcoin_demo_app/ui/views/buy/validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String PurchaseAmountValueKey = 'purchaseAmount';

final Map<String, TextEditingController> _BuyViewTextEditingControllers = {};

final Map<String, FocusNode> _BuyViewFocusNodes = {};

final Map<String, String? Function(String?)?> _BuyViewTextValidations = {
  PurchaseAmountValueKey: FormValidators.purchaseAmountValidator,
};

mixin $BuyView {
  CustomEditingController get purchaseAmountController =>
      _getPurchaseAmountCustomFormTextEditingController(PurchaseAmountValueKey);

  FocusNode get purchaseAmountFocusNode =>
      _getFormFocusNode(PurchaseAmountValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BuyViewTextEditingControllers.containsKey(key)) {
      return _BuyViewTextEditingControllers[key]!;
    }

    _BuyViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _BuyViewTextEditingControllers[key]!;
  }

  CustomEditingController _getPurchaseAmountCustomFormTextEditingController(
    String key,
  ) {
    if (_BuyViewTextEditingControllers.containsKey(key)) {
      return _BuyViewTextEditingControllers[key]! as CustomEditingController;
    }
    _BuyViewTextEditingControllers[key] =
        CustomEditingController.getCustomEditingController();
    return _BuyViewTextEditingControllers[key]! as CustomEditingController;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BuyViewFocusNodes.containsKey(key)) {
      return _BuyViewFocusNodes[key]!;
    }
    _BuyViewFocusNodes[key] = FocusNode();
    return _BuyViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    purchaseAmountController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    purchaseAmountController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PurchaseAmountValueKey: purchaseAmountController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _BuyViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BuyViewFocusNodes.values) {
      focusNode.dispose();
    }

    _BuyViewTextEditingControllers.clear();
    _BuyViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get purchaseAmountValue =>
      this.formValueMap[PurchaseAmountValueKey] as String?;

  set purchaseAmountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PurchaseAmountValueKey: value}),
    );

    if (_BuyViewTextEditingControllers.containsKey(PurchaseAmountValueKey)) {
      _BuyViewTextEditingControllers[PurchaseAmountValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPurchaseAmount =>
      this.formValueMap.containsKey(PurchaseAmountValueKey) &&
      (purchaseAmountValue?.isNotEmpty ?? false);

  bool get hasPurchaseAmountValidationMessage =>
      this.fieldsValidationMessages[PurchaseAmountValueKey]?.isNotEmpty ??
      false;

  String? get purchaseAmountValidationMessage =>
      this.fieldsValidationMessages[PurchaseAmountValueKey];
}

extension Methods on FormStateHelper {
  setPurchaseAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PurchaseAmountValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    purchaseAmountValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PurchaseAmountValueKey: getValidationMessage(PurchaseAmountValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BuyViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BuyViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PurchaseAmountValueKey: getValidationMessage(PurchaseAmountValueKey),
    });
