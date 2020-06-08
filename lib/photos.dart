class Photos{
   var albumId;
   var id;
   var title;
   var url;
   var thumbnailUrl;

  Photos(this.albumId, this.id,this.title,this.url,this.thumbnailUrl);


  Photos.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];

  Map<String, dynamic> toJson() =>
      {
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };
}