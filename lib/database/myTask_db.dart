import 'package:hive/hive.dart';
part 'myTask_db.g.dart';

@HiveType()
class mytask {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int  complited;
  mytask(this.title,this.complited);
}