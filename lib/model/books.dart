class Books {
  String? title;
  String? key;
  List<String>? authorKeys;
  List<String>? authorNames;
  int? firstPublishYear;
  List<String>? editionKey;
  int? coverId;

  Books(
      {this.title,
      this.key,
      this.authorKeys,
      this.authorNames,
      this.firstPublishYear,
      this.editionKey,
      this.coverId});

  Books.fromJson(Map<String, dynamic> json) {
    title = json['work']['title'];
    key = json['work']['key'];
    authorKeys = json['work']['author_keys'].cast<String>();
    authorNames = json['work']['author_names'].cast<String>();
    firstPublishYear = json['work']['first_publish_year'];
    editionKey = json['work']['edition_key'].cast<String>();
    coverId = json['work']['cover_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['key'] = key;
    data['author_keys'] = authorKeys;
    data['author_names'] = authorNames;
    data['first_publish_year'] = firstPublishYear;
    data['edition_key'] = editionKey;
    data['cover_id'] = coverId;
    return data;
  }
}
