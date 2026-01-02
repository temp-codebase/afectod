import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

final class SettingsState extends Equatable {
  final PackageInfo? packageInfo;
  final String selectedLanguage;
  final bool isLoading;

  const SettingsState({
    this.packageInfo,
    this.selectedLanguage = 'Türkçe',
    this.isLoading = true,
  });

  SettingsState copyWith({
    PackageInfo? packageInfo,
    String? selectedLanguage,
    bool? isLoading,
  }) {
    return SettingsState(
      packageInfo: packageInfo ?? this.packageInfo,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [packageInfo, selectedLanguage, isLoading];
}

