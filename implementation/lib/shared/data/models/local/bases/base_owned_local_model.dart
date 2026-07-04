import 'package:zamaan/shared/data/models/local/bases/base_local_model.dart';

/// Base model for user‑owned entities.
///
/// Extends [BaseLocalModel] with ownership and collaboration fields.
abstract class BaseOwnedLocalModel implements BaseLocalModel {
  String get ownerId;
  List<String> get sharedWithUserIds;
}
