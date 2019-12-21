import 'package:hive/hive.dart';
part 'myTask_db.g.dart';

@HiveType()
class Mytask {
  @HiveField(0)
  final String title;

  Mytask(this.title);
}
