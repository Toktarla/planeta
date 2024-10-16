abstract class RemoteNasaArticleEvent {
  const RemoteNasaArticleEvent();
}

class GetNasaArticlesEvent extends RemoteNasaArticleEvent {
    final String selectedDate;
   GetNasaArticlesEvent(this.selectedDate);
}