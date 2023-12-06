import 'package:kretatac/ideas/domain/idea.dart';

extension GetIdeaType on Idea {
  IdeaType getIdeaType(String type) {
    switch (type) {
      case "car":
        return IdeaType.carac;
      case "arg":
        return IdeaType.argument;
      default:
        return IdeaType.argument;
    }
  }
}
