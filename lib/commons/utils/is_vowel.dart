import 'package:kretatac/commons/utils/capitalize_first_letter.dart';

extension IsVowel on String {
  bool isVowel() {
    final List<String> vowels = ["A", "E", "I", "O", "U", "Y", "H"];

    final first = this[0];

    return vowels.contains(first.capitalizeOnlyFirstLetter());
  }
}
