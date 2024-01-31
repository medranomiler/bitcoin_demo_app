class FormValidators {

  static String? purchaseAmountValidator(String? value) {

    final numericRegex = RegExp(r'^[0-9]+$');
    if (value == null || value.isEmpty) {
      return "Purchse amount must not be empty";
    }

    if (value.length > 6) {
      return "Purchase amount must be less than \$1,000,000";
    }

    if(!numericRegex.hasMatch(value)){
      return "Purchse amount must be a number";
    }

    if (int.parse(value) < 10) {
      return "Purchase amount must be greater than \$10";
    }

    return null;
  }
}