abstract class MainScreenState {}

class MainScreenInitialState extends MainScreenState {}

class MainScreenCalculatedState extends MainScreenState {
  final double energy;

  MainScreenCalculatedState(this.energy);
}

class MainScreenErrorState extends MainScreenState {
  final String message;

  MainScreenErrorState(this.message);
}
