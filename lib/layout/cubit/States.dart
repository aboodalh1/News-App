abstract class NewsState {}
class NewsInitialState extends NewsState{}
class NewsBottomNavState extends NewsState{}
class NewsLoadingState extends NewsState{}
class NewsGetBusinessSucState extends NewsState{}
class NewsGetBusinessErrorState extends NewsState{
  late final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsChangeModeState extends NewsState{}
class NewsGetSportSucState extends NewsState{}
class NewsGetSportErrorState extends NewsState{
  late final String error;
  NewsGetSportErrorState(this.error);
}
class NewsGetTechSucState extends NewsState{}
class NewsGetTechErrorState extends NewsState{
  late final String error;
  NewsGetTechErrorState(this.error);
}
class changeMode extends NewsState{}

class NewsSearchState extends NewsState{}
class NewsSearchSucState extends NewsState{}
class NewsSearchErrorState extends NewsState{
  late final String error;
  NewsSearchErrorState(this.error);
}