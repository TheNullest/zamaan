import 'package:flutter/foundation.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/usecases/user/create_local_user_use_case.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';
import 'package:zamaan/core/di/init_dependencies.imports.dart' show sl;

class AuthBootstrapViewModel extends ChangeNotifier {
  final CreateLocalUserUseCase _createLocalUserUseCase;

  AuthBootstrapViewModel({CreateLocalUserUseCase? createLocalUserUseCase})
    : _createLocalUserUseCase = createLocalUserUseCase ?? sl<CreateLocalUserUseCase>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? error;

  Future<bool> createLocalUser({required String displayName, String? email}) async {
    _isLoading = true;
    error = null;
    notifyListeners();

    final user = UserEntity.createLocal(displayName: displayName, email: email);

    try {
      final EResult<void> res = await _createLocalUserUseCase.call(user);
      final bool success = res.fold((l) => false, (r) => true);
      if (!success) {
        error = res.fold((l) => l.message, (_) => null);
      }
      return success;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
