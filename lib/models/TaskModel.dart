import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'TaskModel.g.dart';

@HiveType(typeId: 0)
class TaskModel{

 @HiveField(0)
  @required String? name;

 @HiveField(1)
 @required DateTime? dateTime;

 @HiveField(2)
  @required bool? isCompleted;

 @HiveField(3)
 @required bool? isPending;

 @HiveField(4)
 @required bool? isNotification;

 TaskModel({
 @required this.name,
 @required this.dateTime,
 @required this.isCompleted,
 @required this.isPending,
 @required this.isNotification
});

}