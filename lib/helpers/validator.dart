class Validator {

  // Validate name and at least one last name
  static String? validateFullName(String? value) {
    RegExp nameRegex = RegExp(r"^[a-zA-ZñÑ]+(\s[a-zA-ZñÑ]+)+$");
    if (value != null && !nameRegex.hasMatch(value))
      return "Por favor escribe nombre y apellidos";
    return null;
  }

  // Validate cuban CI (11 digits)
  static String? validateCubanCI(String? value) {
    RegExp idRegex = RegExp(r"^\d{11}$");
    if (value != null && !idRegex.hasMatch(value))
      return "Formato de Carnet de ID no valudo";
    return null;
  }

}
