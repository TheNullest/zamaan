// lib/shared/data/models/local/user_hive_model.dart
import 'package:hive_ce/hive_ce.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_model.dart';
import 'package:zamaan/shared/domain/enums/hive/registration_status.dart';

part 'user_hive_model.g.dart';

/// Hive model for the current local user.
@HiveType(typeId: ClassHiveTypeIds.user) // 11
class UserHiveModel extends BaseHiveModel {
  @HiveField(6)
  final String displayName;

  @HiveField(7)
  final String? avatarPath;

  /// Stored as the enum index to keep the schema compact and Hive-friendly.
  /// The mapper converts to/from [RegistrationStatus].
  @HiveField(8)
  final RegistrationStatus registrationStatus;

  @HiveField(9)
  final String? remoteUserId;

  @HiveField(10)
  final String? email;

  UserHiveModel({
    required super.id,
    required super.createdAt,
    required this.displayName,
    required this.registrationStatus,
    required this.email,
    super.updatedAt,
    super.description,
    super.order,
    this.avatarPath,
    this.remoteUserId,
  });

  @override
  List<Object?> get props => [
    ...super.props,
    displayName,
    avatarPath,
    registrationStatus,
    remoteUserId,
    email,
  ];
}
