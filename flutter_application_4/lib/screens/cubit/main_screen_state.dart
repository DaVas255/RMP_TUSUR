abstract class MainScreenState {}

class MainScreenInitialState extends MainScreenState {}

class MainScreenCalculatedState extends MainScreenState {
  final double energy;

  MainScreenCalculatedState(this.energy);
}

class MainScreenResultState extends MainScreenState {
  final String result;

  MainScreenResultState(this.result);
}
