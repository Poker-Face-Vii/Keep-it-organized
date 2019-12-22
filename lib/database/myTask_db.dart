import 'package:hive/hive.dart';
part 'myTask_db.g.dart';

@HiveType()
class Mytask {
  

  @HiveField(0)
  final String title;
  @HiveField(1)
  final bool status;
  @HiveField(2)
  final String lable;

  Mytask(this.title ,this.status,{this.lable});

}
