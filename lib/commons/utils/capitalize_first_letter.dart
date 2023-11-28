extension CapitalizeFirstLetter on String {
  String capitalizeOnlyFirstLetter() {
    if (this.trim().isEmpty) return "";

    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
