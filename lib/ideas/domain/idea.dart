import 'package:kretatac/commons/utils/capitalize_first_letter.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Idea {
  Idea(
      {required this.name,
      // required this.id,
      required this.cost,
      required this.description,
      required this.subtitle,
      this.artwork,
      this.artwork_url,
      required this.persuasion})
      : id = uuid.v4();

  final double persuasion;
  final String name;
  final String id;
  final int cost;
  final String description;
  final String subtitle;
  final String? artwork;
  final String? artwork_url;

  Idea.fromCsvRow(Map<String, dynamic> csvMap)
      : name = csvMap["name"].toString().capitalizeOnlyFirstLetter(),
        cost = int.tryParse(csvMap["cost"]) ?? 3,
        description =
            csvMap["description"].toString().capitalizeOnlyFirstLetter(),
        subtitle = csvMap["subtitle"].toString().capitalizeOnlyFirstLetter(),
        persuasion = double.tryParse(csvMap["persuasion"]) ?? 0.1,
        artwork = (csvMap["artwork"])?.toString(),
        artwork_url = csvMap["artwork_url"]?.toString(),
        id = uuid.v4();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Idea &&
        other.persuasion == persuasion &&
        other.name == name &&
        other.id == id &&
        other.cost == cost &&
        other.description == description &&
        other.subtitle == subtitle &&
        other.artwork == artwork;
  }

  @override
  int get hashCode {
    return persuasion.hashCode ^
        name.hashCode ^
        id.hashCode ^
        cost.hashCode ^
        description.hashCode ^
        subtitle.hashCode ^
        artwork.hashCode;
  }
}
