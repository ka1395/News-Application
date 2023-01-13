abstract class NewsState {}

class InitNews extends NewsState {}

class IncrementIndex extends NewsState {}

class NewsGetBusinessloadingstate extends NewsState {}

class NewsGetBusinesssuccessstate extends NewsState {}

class NewsGetBusinesserrorstate extends NewsState {
  final String error;

  NewsGetBusinesserrorstate(this.error);

}


class NewsGetSportloadingstate extends NewsState {}

class NewsGetSportsuccessstate extends NewsState {}

class NewsGetSporterrorstate extends NewsState {
  final String error;

  NewsGetSporterrorstate(this.error);

}



class NewsGetSciensloadingstate extends NewsState {}

class NewsGetScienssuccessstate extends NewsState {}

class NewsGetScienserrorstate extends NewsState {
  final String error;

  NewsGetScienserrorstate(this.error);
}

class ThemeModeChange extends NewsState {}

class NewsGetSearchsuccessstate extends NewsState {}

class NewsGetSearchloadingstate extends NewsState {}

class NewsGetSearcherrorstate extends NewsState {
  final String error;

  NewsGetSearcherrorstate(this.error);
}
