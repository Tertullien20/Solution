String? number(String? str, {errorMessage}) {
  if (str != null && int.tryParse(str) != null) {
    return null;
  } else {
    return errorMessage ?? "Nombre invalide";
  }
}