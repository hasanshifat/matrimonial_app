import 'package:hive/hive.dart';

part 'short_listed_class.g.dart';

@HiveType(typeId: 1)
class ShortListedClass {
  ShortListedClass({required this.biodataID});
  @HiveField(0)
  int biodataID;

}