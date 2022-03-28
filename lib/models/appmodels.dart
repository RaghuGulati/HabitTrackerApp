import 'package:hive/hive.dart';

part 'appmodels.g.dart';

@HiveType(typeId: 0)
class AddHabit extends HiveObject {
  @HiveField(0)
  late String HabitName;

  @HiveField(1)
  late List<bool> Frequency;

  AddHabit({
    required this.HabitName,
    required this.Frequency,
  });
  
}