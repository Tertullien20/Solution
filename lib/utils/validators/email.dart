String? email(String? val, {String message = ''}) {
  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val!)) {
    return message.isNotEmpty ? message : 'Adresse mail invalide';
  }
  return null;
}