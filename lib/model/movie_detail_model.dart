class MovieDetailModel {
  String alt;
  String doubanSite;
  String id;
  String mainlandPubdate;
  String mobileUrl;
  String originalTitle;
  String pubdate;
  String scheduleUrl;
  String shareUrl;
  String subtype;
  String summary;
  String title;
  String year;
  bool hasSchedule;
  bool hasTicket;
  bool hasVideo;
  int collectCount;
  int commentsCount;
  int photosCount;
  int ratingsCount;
  int reviewsCount;
  int wishCount;
  ImagesBean images;
  RatingBeanA rating;
  List<String> aka;
  List<String> blooperUrls;
  List<String> countries;
  List<String> durations;
  List<String> genres;
  List<String> languages;
  List<String> pubdates;
  List<String> tags;
  List<String> trailerUrls;
  List<BloopersListBean> bloopers;
  List<CastsListBean> casts;
  List<DirectorsListBean> directors;
  List<PhotosListBean> photos;
  List<PopularCommentsListBean> popularComments;
  List<PopularReviewsListBean> popularReviews;
  List<TrailersListBean> trailers;
  List<WritersListBean> writers;

  MovieDetailModel({this.alt, this.doubanSite, this.id, this.mainlandPubdate, this.mobileUrl, this.originalTitle, this.pubdate, this.scheduleUrl, this.shareUrl, this.subtype, this.summary, this.title, this.year, this.hasSchedule, this.hasTicket, this.hasVideo, this.collectCount, this.commentsCount, this.photosCount, this.ratingsCount, this.reviewsCount, this.wishCount, this.images, this.rating, this.bloopers, this.casts, this.directors, this.photos, this.popularComments, this.popularReviews, this.trailers, this.writers, this.aka, this.blooperUrls, this.countries, this.durations, this.genres, this.languages, this.pubdates, this.tags, this.trailerUrls});

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.doubanSite = json['douban_site'];
    this.id = json['id'];
    this.mainlandPubdate = json['mainland_pubdate'];
    this.mobileUrl = json['mobile_url'];
    this.originalTitle = json['original_title'];
    this.pubdate = json['pubdate'];
    this.scheduleUrl = json['schedule_url'];
    this.shareUrl = json['share_url'];
    this.subtype = json['subtype'];
    this.summary = json['summary'];
    this.title = json['title'];
    this.year = json['year'];
    this.hasSchedule = json['has_schedule'];
    this.hasTicket = json['has_ticket'];
    this.hasVideo = json['has_video'];
    this.collectCount = json['collect_count'];
    this.commentsCount = json['comments_count'];
    this.photosCount = json['photos_count'];
    this.ratingsCount = json['ratings_count'];
    this.reviewsCount = json['reviews_count'];
    this.wishCount = json['wish_count'];
    this.images = json['images'] != null ? ImagesBean.fromJson(json['images']) : null;
    this.rating = json['rating'] != null ? RatingBeanA.fromJson(json['rating']) : null;
    this.bloopers = (json['bloopers'] as List)!=null?(json['bloopers'] as List).map((i) => BloopersListBean.fromJson(i)).toList():null;
    this.casts = (json['casts'] as List)!=null?(json['casts'] as List).map((i) => CastsListBean.fromJson(i)).toList():null;
    this.directors = (json['directors'] as List)!=null?(json['directors'] as List).map((i) => DirectorsListBean.fromJson(i)).toList():null;
    this.photos = (json['photos'] as List)!=null?(json['photos'] as List).map((i) => PhotosListBean.fromJson(i)).toList():null;
    this.popularComments = (json['popular_comments'] as List)!=null?(json['popular_comments'] as List).map((i) => PopularCommentsListBean.fromJson(i)).toList():null;
    this.popularReviews = (json['popular_reviews'] as List)!=null?(json['popular_reviews'] as List).map((i) => PopularReviewsListBean.fromJson(i)).toList():null;
    this.trailers = (json['trailers'] as List)!=null?(json['trailers'] as List).map((i) => TrailersListBean.fromJson(i)).toList():null;
    this.writers = (json['writers'] as List)!=null?(json['writers'] as List).map((i) => WritersListBean.fromJson(i)).toList():null;

    List<dynamic> akaList = json['aka'];
    this.aka = new List();
    this.aka.addAll(akaList.map((o) => o.toString()));

    List<dynamic> blooperUrlsList = json['blooper_urls'];
    this.blooperUrls = new List();
    this.blooperUrls.addAll(blooperUrlsList.map((o) => o.toString()));

    List<dynamic> countriesList = json['countries'];
    this.countries = new List();
    this.countries.addAll(countriesList.map((o) => o.toString()));

    List<dynamic> durationsList = json['durations'];
    this.durations = new List();
    this.durations.addAll(durationsList.map((o) => o.toString()));

    List<dynamic> genresList = json['genres'];
    this.genres = new List();
    this.genres.addAll(genresList.map((o) => o.toString()));

    List<dynamic> languagesList = json['languages'];
    this.languages = new List();
    this.languages.addAll(languagesList.map((o) => o.toString()));

    List<dynamic> pubdatesList = json['pubdates'];
    this.pubdates = new List();
    this.pubdates.addAll(pubdatesList.map((o) => o.toString()));

    List<dynamic> tagsList = json['tags'];
    this.tags = new List();
    this.tags.addAll(tagsList.map((o) => o.toString()));

    List<dynamic> trailerUrlsList = json['trailer_urls'];
    this.trailerUrls = new List();
    this.trailerUrls.addAll(trailerUrlsList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['douban_site'] = this.doubanSite;
    data['id'] = this.id;
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['mobile_url'] = this.mobileUrl;
    data['original_title'] = this.originalTitle;
    data['pubdate'] = this.pubdate;
    data['schedule_url'] = this.scheduleUrl;
    data['share_url'] = this.shareUrl;
    data['subtype'] = this.subtype;
    data['summary'] = this.summary;
    data['title'] = this.title;
    data['year'] = this.year;
    data['has_schedule'] = this.hasSchedule;
    data['has_ticket'] = this.hasTicket;
    data['has_video'] = this.hasVideo;
    data['collect_count'] = this.collectCount;
    data['comments_count'] = this.commentsCount;
    data['photos_count'] = this.photosCount;
    data['ratings_count'] = this.ratingsCount;
    data['reviews_count'] = this.reviewsCount;
    data['wish_count'] = this.wishCount;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['bloopers'] = this.bloopers != null?this.bloopers.map((i) => i.toJson()).toList():null;
    data['casts'] = this.casts != null?this.casts.map((i) => i.toJson()).toList():null;
    data['directors'] = this.directors != null?this.directors.map((i) => i.toJson()).toList():null;
    data['photos'] = this.photos != null?this.photos.map((i) => i.toJson()).toList():null;
    data['popular_comments'] = this.popularComments != null?this.popularComments.map((i) => i.toJson()).toList():null;
    data['popular_reviews'] = this.popularReviews != null?this.popularReviews.map((i) => i.toJson()).toList():null;
    data['trailers'] = this.trailers != null?this.trailers.map((i) => i.toJson()).toList():null;
    data['writers'] = this.writers != null?this.writers.map((i) => i.toJson()).toList():null;
    data['aka'] = this.aka;
    data['blooper_urls'] = this.blooperUrls;
    data['countries'] = this.countries;
    data['durations'] = this.durations;
    data['genres'] = this.genres;
    data['languages'] = this.languages;
    data['pubdates'] = this.pubdates;
    data['tags'] = this.tags;
    data['trailer_urls'] = this.trailerUrls;
    return data;
  }

}

class ImagesBean {
  String large;
  String medium;
  String small;

  ImagesBean({this.large, this.medium, this.small});

  ImagesBean.fromJson(Map<String, dynamic> json) {
    this.large = json['large'];
    this.medium = json['medium'];
    this.small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['small'] = this.small;
    return data;
  }
}

class RatingBean {
  double value;
  int max;
  int min;

  RatingBean({this.value, this.max, this.min});

  RatingBean.fromJson(Map<String, dynamic> json) {
    this.value = json['value']?.toDouble();
    this.max = json['max'];
    this.min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['max'] = this.max;
    data['min'] = this.min;
    return data;
  }
}

class BloopersListBean {
  String alt;
  String id;
  String medium;
  String resourceUrl;
  String small;
  String subjectId;
  String title;

  BloopersListBean({this.alt, this.id, this.medium, this.resourceUrl, this.small, this.subjectId, this.title});

  BloopersListBean.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.id = json['id'];
    this.medium = json['medium'];
    this.resourceUrl = json['resource_url'];
    this.small = json['small'];
    this.subjectId = json['subject_id'];
    this.title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['medium'] = this.medium;
    data['resource_url'] = this.resourceUrl;
    data['small'] = this.small;
    data['subject_id'] = this.subjectId;
    data['title'] = this.title;
    return data;
  }
}

class CastsListBean {
  String alt;
  String id;
  String name;
  String nameEn;
  AvatarsBean avatars;

  CastsListBean({this.alt, this.id, this.name, this.nameEn, this.avatars});

  CastsListBean.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.id = json['id'];
    this.name = json['name'];
    this.nameEn = json['name_en'];
    this.avatars = json['avatars'] != null ? AvatarsBean.fromJson(json['avatars']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    return data;
  }
}

class DirectorsListBean {
  String alt;
  String id;
  String name;
  String nameEn;
  AvatarsBean avatars;

  DirectorsListBean({this.alt, this.id, this.name, this.nameEn, this.avatars});

  DirectorsListBean.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.id = json['id'];
    this.name = json['name'];
    this.nameEn = json['name_en'];
    this.avatars = json['avatars'] != null ? AvatarsBean.fromJson(json['avatars']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    return data;
  }
}

class PhotosListBean {
  String alt;
  String cover;
  String icon;
  String id;
  String image;
  String thumb;

  PhotosListBean({this.alt, this.cover, this.icon, this.id, this.image, this.thumb});

  PhotosListBean.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.cover = json['cover'];
    this.icon = json['icon'];
    this.id = json['id'];
    this.image = json['image'];
    this.thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['cover'] = this.cover;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['image'] = this.image;
    data['thumb'] = this.thumb;
    return data;
  }
}

class PopularCommentsListBean {
  String content;
  String createdAt;
  String id;
  String subjectId;
  int usefulCount;
  AuthorBean author;
  RatingBean rating;

  PopularCommentsListBean({this.content, this.createdAt, this.id, this.subjectId, this.usefulCount, this.author, this.rating});

  PopularCommentsListBean.fromJson(Map<String, dynamic> json) {
    this.content = json['content'];
    this.createdAt = json['created_at'];
    this.id = json['id'];
    this.subjectId = json['subject_id'];
    this.usefulCount = json['useful_count'];
    this.author = json['author'] != null ? AuthorBean.fromJson(json['author']) : null;
    this.rating = json['rating'] != null ? RatingBean.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['subject_id'] = this.subjectId;
    data['useful_count'] = this.usefulCount;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    return data;
  }
}

class PopularReviewsListBean {
  String alt;
  String id;
  String subjectId;
  String summary;
  String title;
  AuthorBean author;
  RatingBean rating;

  PopularReviewsListBean({this.alt, this.id, this.subjectId, this.summary, this.title, this.author, this.rating});

  PopularReviewsListBean.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.id = json['id'];
    this.subjectId = json['subject_id'];
    this.summary = json['summary'];
    this.title = json['title'];
    this.author = json['author'] != null ? AuthorBean.fromJson(json['author']) : null;
    this.rating = json['rating'] != null ? RatingBean.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['subject_id'] = this.subjectId;
    data['summary'] = this.summary;
    data['title'] = this.title;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    return data;
  }
}

class TrailersListBean {
  String alt;
  String id;
  String medium;
  String resourceUrl;
  String small;
  String subjectId;
  String title;

  TrailersListBean({this.alt, this.id, this.medium, this.resourceUrl, this.small, this.subjectId, this.title});

  TrailersListBean.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.id = json['id'];
    this.medium = json['medium'];
    this.resourceUrl = json['resource_url'];
    this.small = json['small'];
    this.subjectId = json['subject_id'];
    this.title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['medium'] = this.medium;
    data['resource_url'] = this.resourceUrl;
    data['small'] = this.small;
    data['subject_id'] = this.subjectId;
    data['title'] = this.title;
    return data;
  }
}

class WritersListBean {
  String alt;
  String id;
  String name;
  String nameEn;
  AvatarsBean avatars;

  WritersListBean({this.alt, this.id, this.name, this.nameEn, this.avatars});

  WritersListBean.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.id = json['id'];
    this.name = json['name'];
    this.nameEn = json['name_en'];
    this.avatars = json['avatars'] != null ? AvatarsBean.fromJson(json['avatars']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    return data;
  }
}

class AvatarsBean {
  String large;
  String medium;
  String small;

  AvatarsBean({this.large, this.medium, this.small});

  AvatarsBean.fromJson(Map<String, dynamic> json) {
    this.large = json['large'];
    this.medium = json['medium'];
    this.small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['small'] = this.small;
    return data;
  }
}

class AuthorBean {
  String alt;
  String avatar;
  String id;
  String name;
  String signature;
  String uid;

  AuthorBean({this.alt, this.avatar, this.id, this.name, this.signature, this.uid});

  AuthorBean.fromJson(Map<String, dynamic> json) {
    this.alt = json['alt'];
    this.avatar = json['avatar'];
    this.id = json['id'];
    this.name = json['name'];
    this.signature = json['signature'];
    this.uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    data['name'] = this.name;
    data['signature'] = this.signature;
    data['uid'] = this.uid;
    return data;
  }
}


class RatingBeanA {
  double average;
  DetailsBean details;
  int max;
  int min;
  String stars;

  RatingBeanA({this.average, this.details, this.max, this.min, this.stars});

  factory RatingBeanA.fromJson(Map<String, dynamic> json) {
    return RatingBeanA(
      average: json['average']?.toDouble(),
      details: json['details'] != null ? DetailsBean.fromJson(json['details']) : null,
      max: json['max'],
      min: json['min'],
      stars: json['stars'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['max'] = this.max;
    data['min'] = this.min;
    data['stars'] = this.stars;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}


class DetailsBean {
  double i1;
  double i2;
  double i3;
  double i4;
  double i5;

  DetailsBean({this.i1, this.i2, this.i3, this.i4, this.i5});

  DetailsBean.fromJson(Map<String, dynamic> json) {
    this.i1 = json['1']?.toDouble();
    this.i2 = json['2']?.toDouble();
    this.i3 = json['3']?.toDouble();
    this.i4 = json['4']?.toDouble();
    this.i5 = json['5']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.i1;
    data['2'] = this.i2;
    data['3'] = this.i3;
    data['4'] = this.i4;
    data['5'] = this.i5;
    return data;
  }
}





