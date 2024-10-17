class NewsModel {
  late final String articleId;
  late final String title;
  late final String link;
  String? description;
  String? content;
  late final String pubDate;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  String? sourceName;
  String? sourceUrl;
  String? sourceIcon;
  String? language;

  String? aiTag;
  String? sentiment;
  String? sentimentStats;
  String? aiRegion;
  String? aiOrg;
  bool? duplicate;

  NewsModel.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    // keywords = json['keywords'].cast<String>();
    // creator = json['creator'].cast<String>();
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourcePriority = json['source_priority'];
    sourceName = json['source_name'];
    sourceUrl = json['source_url'];
    sourceIcon = json['source_icon'];
    language = json['language'];

    aiTag = json['ai_tag'];
    sentiment = json['sentiment'];
    sentimentStats = json['sentiment_stats'];
    aiRegion = json['ai_region'];
    aiOrg = json['ai_org'];
    duplicate = json['duplicate'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['article_id'] = this.articleId;
  //   data['title'] = this.title;
  //   data['link'] = this.link;
  //   data['description'] = this.description;
  //   data['content'] = this.content;
  //   data['pubDate'] = this.pubDate;
  //   data['image_url'] = this.imageUrl;
  //   data['source_id'] = this.sourceId;
  //   data['source_priority'] = this.sourcePriority;
  //   data['source_name'] = this.sourceName;
  //   data['source_url'] = this.sourceUrl;
  //   data['source_icon'] = this.sourceIcon;
  //   data['language'] = this.language;
  //   data['ai_tag'] = this.aiTag;
  //   data['sentiment'] = this.sentiment;
  //   data['sentiment_stats'] = this.sentimentStats;
  //   data['ai_region'] = this.aiRegion;
  //   data['ai_org'] = this.aiOrg;
  //   data['duplicate'] = this.duplicate;
  //   return data;
  // }
}
