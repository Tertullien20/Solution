String? empty(String? str, {errorMessage}) {
  if (str != null && str.isNotEmpty) {
    return null;
  } else {
    return errorMessage ?? "Champ obligatoire";
  }
}
