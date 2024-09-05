import 'package:hive/hive.dart';

part 'response_model.g.dart';

@HiveType(typeId: 0)
class ResponseModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String question;

  @HiveField(2)
  final List<String> solutionSteps;

  @HiveField(3)
  final String result;

  ResponseModel(
      {required this.id,
      required this.question,
      required this.solutionSteps,
      required this.result});
}
