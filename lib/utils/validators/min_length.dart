String? minLength(String? str, {errorMessage, int minChar = 6}) {
  if (str != null && str.length >= minChar) {
    return null;
  } else {
    return errorMessage ?? "Minimum $minChar caractères";
  }
}