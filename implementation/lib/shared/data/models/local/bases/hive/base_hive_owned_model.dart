import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_model.dart';

/// A specialized base class for entities that belong to a specific user.
///
/// Use this for Tasks, Goals, Schedules, etc.
abstract class BaseHiveOwnedModel extends BaseHiveModel implements BaseOwnedLocalModel {
  BaseHiveOwnedModel({
    required super.id,
    required super.createdAt,
    required this.ownerId,
    this.sharedWithUserIds = const [],
    super.description,
    super.updatedAt,
    super.order,
  });

  /// The ID of the original creator/owner.
  @override
  @HiveField(1)
  final String ownerId;

  /// IDs of other users who have access to this data (Requirement #4 Collaboration).
  @override
  @HiveField(8)
  final List<String> sharedWithUserIds;

  @override
  List<Object?> get props => [...super.props, ownerId, sharedWithUserIds];
}
