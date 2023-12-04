import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kretatac/commons/constants/data_urls.dart';

class CSVParser {
  CSVParser({required this.path, this.type});

  final String path;
  final NetworkData? type;

  Future<List<List<dynamic>>> processCsv() async {
    debugPrint('processCsv triggered');
    var result = await rootBundle.loadString(path);

    final request = type != null ? await Dio().get(type!.url) : null;
    if (request != null || request?.statusCode == 200) {
      print("${request!.statusCode} for $type");

      result = request.data;
    }

    return const CsvToListConverter().convert(
      result,
      convertEmptyTo: null,
      shouldParseNumbers: false,
    );
  }

  Future<List<Map<String, dynamic>>> getMapFromList() async {
    final List<List<dynamic>> result = await processCsv();

    List<Map<String, dynamic>> mapList = [];

    final headers = result[0];
    for (final row in result.skip(1)) {
      final map = <String, dynamic>{};
      for (var i = 0; i < row.length; i++) {
        map[headers[i]] = row[i];
      }
      mapList.add(map);
    }
    // debugPrint(mapList.toString());
    return mapList;
  }
}
