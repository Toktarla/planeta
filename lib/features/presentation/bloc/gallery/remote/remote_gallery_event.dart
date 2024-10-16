abstract class RemoteGalleryEvent {
  const RemoteGalleryEvent();
}

class GetPhotosByQueryEvent extends RemoteGalleryEvent {
  final String query;
  final String per_page;

  GetPhotosByQueryEvent(this.query,this.per_page);
}