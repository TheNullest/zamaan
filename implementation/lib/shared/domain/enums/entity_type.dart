import 'package:zamaan/core/extensions/string.dart';

enum EntityType { task, subTask, goal, schedule, activity, category, tag, project, user, settings }

extension EntityTypeExtension on EntityType {
  String get displayName => toString().split('.').last.toSentenceCase();
}
