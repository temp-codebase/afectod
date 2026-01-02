part of 'main_cubit.dart';

class MainState extends Equatable {
  final int currentIndex;
  final bool isLoading;

  const MainState({
    this.currentIndex = 0,
    this.isLoading = false,
  });

  MainState copyWith({
    int? currentIndex,
    bool? isLoading,
  }) {
    return MainState(
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [currentIndex, isLoading];
}

