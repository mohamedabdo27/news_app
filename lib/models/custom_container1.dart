// class Container1Model {
//   final String? image;
//   final String text1;
//   final String? text2;
//   final String text3;
//   final String link;
//   final String id;
//   Container1Model({
//     required this.link,
//     required this.image,
//     required this.text1,
//     required this.text2,
//     required this.text3,
//     required this.id,
//   });
// }
class Container1Model {
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

  // Container1Model(
  //     {required this.articleId,
  //     this.title,
  //     this.link,
  //     this.keywords,
  //     this.creator,
  //     required this.description,
  //     this.content,
  //     this.pubDate,
  //     this.imageUrl,
  //     this.sourceId,
  //     this.sourcePriority,
  //     this.sourceName,
  //     this.sourceUrl,
  //     this.sourceIcon,
  //     this.language,
  //     this.country,
  //     this.category,
  //     this.aiTag,
  //     this.sentiment,
  //     this.sentimentStats,
  //     this.aiRegion,
  //     this.aiOrg,
  //     this.duplicate});

  Container1Model.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['title'] = this.title;
    data['link'] = this.link;

    data['description'] = this.description;
    data['content'] = this.content;
    data['pubDate'] = this.pubDate;
    data['image_url'] = this.imageUrl;
    data['source_id'] = this.sourceId;
    data['source_priority'] = this.sourcePriority;
    data['source_name'] = this.sourceName;
    data['source_url'] = this.sourceUrl;
    data['source_icon'] = this.sourceIcon;
    data['language'] = this.language;

    data['ai_tag'] = this.aiTag;
    data['sentiment'] = this.sentiment;
    data['sentiment_stats'] = this.sentimentStats;
    data['ai_region'] = this.aiRegion;
    data['ai_org'] = this.aiOrg;
    data['duplicate'] = this.duplicate;
    return data;
  }
}
