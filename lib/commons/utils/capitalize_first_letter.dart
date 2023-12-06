extension CapitalizeFirstLetter on String {
  String capitalizeOnlyFirstLetter() {
    // ignore: unnecessary_this
    if (this.trim().isEmpty) return "";

    // ignore: unnecessary_this
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
