import 'dart:convert';

String chiffrementSimple(String input, String key) {
  List<int> inputBytes = utf8.encode(input);
  List<int> keyBytes = utf8.encode(key);

  List<int> result = List.generate(inputBytes.length, (i) {
    return inputBytes[i] ^ keyBytes[i % keyBytes.length];
  });

  return base64Encode(result);
}

/// Déchiffre un texte chiffré
String dechiffrementSimple(String encryptedBase64, String key) {
  List<int> encryptedBytes = base64Decode(encryptedBase64);
  List<int> keyBytes = utf8.encode(key);

  List<int> result = List.generate(encryptedBytes.length, (i) {
    return encryptedBytes[i] ^ keyBytes[i % keyBytes.length];
  });

  return utf8.decode(result);
}