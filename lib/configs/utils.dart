import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Get app context
Future<BuildContext> get getxContext async {
  while (Get.context == null) {
    await Future.delayed(Duration(milliseconds: 20));
  }

  return Get.context!;
}

/// Calculate height by scale
///
/// ```
/// // Get the height of 16/9 according to the screen width
/// double height = calculateHeightByScale(Get.width, 16/9);
/// ```
double calculateHeightByScale(double width, double scale) {
  return width / scale;
}

/// Calculate grid aspect ratio
///
/// ```
/// double crossAxisSpacing = 8;
/// int crossAxisCount = 4;
/// double itemHeight = 60;
/// double childAspectRatio = calculateChildAspectRatio(
///   Get.width,
///   crossAxisSpacing,
///   crossAxisCount,
///   itemHeight);
/// GridView.builder(
///   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
///     crossAxisCount: crossAxisCount,
//      mainAxisSpacing: 0,
//      crossAxisSpacing: crossAxisSpacing,
//      childAspectRatio: childAspectRatio,
///   )
/// );
/// ```
double calculateGridAspectRatio(
    double gridWidth,
    double crossAxisSpacing,
    int crossAxisCount,
    double itemHeight,
    ) {
  return (gridWidth - (crossAxisCount - 1) * crossAxisSpacing) /
      crossAxisCount /
      itemHeight;
}

/// Calculate grid item size
///
/// ```
/// double crossAxisSpacing = 8;
/// int crossAxisCount = 4;
/// Size itemSize = calculateGridItemSize(
///     Grid.width
///     crossAxisSpacing,
///     crossAxisCount,
///     4 / 3);
/// ```
Size calculateGridItemSize(
    double gridWidth,
    double crossAxisSpacing,
    int crossAxisCount,
    double scale,
    ) {
  double width =
      (gridWidth - (crossAxisCount - 1) * crossAxisSpacing) / crossAxisCount;
  return Size(width, width / scale);
}

/// Fixed TextOverflow.ellipsis
///
/// ```
/// Text(breakWord(str),
//    maxLines: 1,
//    overflow: TextOverflow.ellipsis);
/// ```
String breakWord(String word) {
  if (word.isEmpty) {
    return word;
  }
  String breakWord = '';
  word.runes.forEach((element) {
    breakWord += String.fromCharCode(element);
    breakWord += '\u200B';
  });
  return breakWord;
}

/// Whether the string is empty or null
bool isEmptyOrNullString(String? text) {
  return ['', null].contains(text);
}

/// Enum to string
///
/// ```
/// enum MyEnum {A, B, C}
/// String e = enumToString(MyEnum.B);
/// print(e); // is B
/// ```
String enumToString(obj) => obj.toString().split('.').last;

/// Enum from string
///
/// ```
/// enum MyEnum {A, B, C}
/// MyEnum e = enumFromString<MyEnum>(MyEnum.values, 'B');
/// print(e); // is MyEnum.B
/// ```
T enumFromString<T>(Iterable<T> values, String value) {
  return values.firstWhere((type) => type.toString().split('.').last == value,
      orElse: () {
        throw 'Undefined enumeration type!';
      });
}

/// Build entity list
///
/// ```
/// List users =
///   [{'id': 1, 'username': 'Jobs'}, {'id': 2, 'username': 'Gates'}];
/// List<UserEntity> list =
///   buildEntityList<UserEntity>(users, (row) => UserEntity.fromJson(row));
/// ```
List<T> buildEntityList<T>(Iterable data, BuildEntityListCallback<T> callback,
    {bool growable = false}) {
  return data.map<T>((e) => callback(e)).toList(growable: growable);
}

typedef T BuildEntityListCallback<T>(Map<String, dynamic> element);
