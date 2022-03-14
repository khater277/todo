import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'TaskModel.g.dart';

@HiveType(typeId: 0)
class TaskModel{

 @HiveField(0)
  @required String? name;

 @HiveField(1)
 @required DateTime? dateTime;

 TaskModel({
 @required this.name,
 @required this.dateTime,
});

}