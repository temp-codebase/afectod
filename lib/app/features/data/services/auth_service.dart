import 'package:afectod/app/features/data/models/auth/user_model.dart';
import 'package:hive_ce/hive.dart';
import 'package:uuid/uuid.dart';

class AuthService {
  static const String _usersBoxName = 'users';
  static const String _currentUserIdKey = 'currentUserId';

  Box<UserModel>? _usersBox;
  Box? _authBox;

  Future<void> init() async {
    _usersBox = await Hive.openBox<UserModel>(_usersBoxName);
    _authBox = await Hive.openBox('auth');
  }

  Future<({bool success, String? error, UserModel? user})> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final existingUser = _usersBox?.values.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
        orElse: () => UserModel(
          id: '',
          username: '',
          email: '',
          password: '',
          createdAt: DateTime.now(),
        ),
      );
      if (existingUser?.email.isNotEmpty == true) {
        return (success: false, error: 'auth_email_already_exists', user: null);
      }
      final user = UserModel(
        id: const Uuid().v4(),
        username: username,
        email: email,
        password: password,
        createdAt: DateTime.now(),
      );
      await _usersBox?.put(user.id, user);
      await _authBox?.put(_currentUserIdKey, user.id);
      return (success: true, error: null, user: user);
    } catch (e) {
      return (success: false, error: 'auth_error_occurred', user: null);
    }
  }

  Future<({bool success, String? error, UserModel? user})> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = _usersBox?.values.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
        orElse: () => UserModel(
          id: '',
          username: '',
          email: '',
          password: '',
          createdAt: DateTime.now(),
        ),
      );
      if (user?.email.isEmpty == true) {
        return (success: false, error: 'auth_email_not_found', user: null);
      }
      if (user?.password != password) {
        return (success: false, error: 'auth_password_mismatch', user: null);
      }
      await _authBox?.put(_currentUserIdKey, user?.id);
      return (success: true, error: null, user: user);
    } catch (e) {
      return (success: false, error: 'auth_error_occurred', user: null);
    }
  }

  Future<({bool success, String? error})> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final currentUser = getCurrentUser();
      if (currentUser == null) {
        return (success: false, error: 'auth_not_logged_in');
      }
      if (currentUser.password != currentPassword) {
        return (success: false, error: 'auth_current_password_wrong');
      }
      final updatedUser = currentUser.copyWith(password: newPassword);
      await _usersBox?.put(updatedUser.id, updatedUser);
      return (success: true, error: null);
    } catch (e) {
      return (success: false, error: 'auth_error_occurred');
    }
  }

  Future<void> logout() async {
    await _authBox?.delete(_currentUserIdKey);
  }

  UserModel? getCurrentUser() {
    final currentUserId = _authBox?.get(_currentUserIdKey);
    if (currentUserId == null) return null;
    return _usersBox?.get(currentUserId);
  }

  bool isLoggedIn() {
    return getCurrentUser() != null;
  }

  Future<void> clearAllUsers() async {
    await _usersBox?.clear();
    await _authBox?.clear();
  }
}
