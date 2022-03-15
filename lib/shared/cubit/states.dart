abstract class NewsState {}

class NewsInState extends NewsState {}

class NewsGetSucess extends NewsInState {}

class NewsGeterror extends NewsInState {
   final String error;
  NewsGeterror(this.error);
}

class Newloading extends NewsInState {}

class NewsPutDark extends NewsInState {}

class OpenAd extends NewsInState {}
class ValueSetSuccess extends NewsInState {}