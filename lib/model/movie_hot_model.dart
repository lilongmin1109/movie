class MovieHotModel {
    int count;
    int start;
    List<Subject> subjects;
    String title;
    int total;

    MovieHotModel({this.count, this.start, this.subjects, this.title, this.total});

    factory MovieHotModel.fromJson(Map<String, dynamic> json) {
        return MovieHotModel(
            count: json['count'],
            start: json['start'],
            subjects: json['subjects'] != null ? (json['subjects'] as List).map((i) => Subject.fromJson(i)).toList() : null,
            title: json['title'],
            total: json['total'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['start'] = this.start;
        data['title'] = this.title;
        data['total'] = this.total;
        if (this.subjects != null) {
            data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Subject {
    String alt;
    List<Cast> casts;
    int collect_count;
    List<Director> directors;
    List<String> durations;
    List<String> genres;
    bool has_video;
    String id;
    Images images;
    String mainland_pubdate;
    String original_title;
    List<String> pubdates;
    Rating rating;
    String subtype;
    String title;
    String year;

    Subject({this.alt, this.casts, this.collect_count, this.directors, this.durations, this.genres, this.has_video, this.id, this.images, this.mainland_pubdate, this.original_title, this.pubdates, this.rating, this.subtype, this.title, this.year});

    factory Subject.fromJson(Map<String, dynamic> json) {
        return Subject(
            alt: json['alt'],
            casts: json['casts'] != null ? (json['casts'] as List).map((i) => Cast.fromJson(i)).toList() : null,
            collect_count: json['collect_count'],
            directors: json['directors'] != null ? (json['directors'] as List).map((i) => Director.fromJson(i)).toList() : null,
            durations: json['durations'] != null ? new List<String>.from(json['durations']) : null,
            genres: json['genres'] != null ? new List<String>.from(json['genres']) : null,
            has_video: json['has_video'],
            id: json['id'],
            images: json['images'] != null ? Images.fromJson(json['images']) : null,
            mainland_pubdate: json['mainland_pubdate'],
            original_title: json['original_title'],
            pubdates: json['pubdates'] != null ? new List<String>.from(json['pubdates']) : null,
            rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
            subtype: json['subtype'],
            title: json['title'],
            year: json['year'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alt'] = this.alt;
        data['collect_count'] = this.collect_count;
        data['has_video'] = this.has_video;
        data['id'] = this.id;
        data['mainland_pubdate'] = this.mainland_pubdate;
        data['original_title'] = this.original_title;
        data['subtype'] = this.subtype;
        data['title'] = this.title;
        data['year'] = this.year;
        if (this.casts != null) {
            data['casts'] = this.casts.map((v) => v.toJson()).toList();
        }
        if (this.directors != null) {
            data['directors'] = this.directors.map((v) => v.toJson()).toList();
        }
        if (this.durations != null) {
            data['durations'] = this.durations;
        }
        if (this.genres != null) {
            data['genres'] = this.genres;
        }
        if (this.images != null) {
            data['images'] = this.images.toJson();
        }
        if (this.pubdates != null) {
            data['pubdates'] = this.pubdates;
        }
        if (this.rating != null) {
            data['rating'] = this.rating.toJson();
        }
        return data;
    }
}

class Director {
    String alt;
    AvatarsX avatars;
    String id;
    String name;
    String name_en;

    Director({this.alt, this.avatars, this.id, this.name, this.name_en});

    factory Director.fromJson(Map<String, dynamic> json) {
        return Director(
            alt: json['alt'],
            avatars: json['avatars'] != null ? AvatarsX.fromJson(json['avatars']) : null,
            id: json['id'],
            name: json['name'],
            name_en: json['name_en'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alt'] = this.alt;
        data['id'] = this.id;
        data['name'] = this.name;
        data['name_en'] = this.name_en;
        if (this.avatars != null) {
            data['avatars'] = this.avatars.toJson();
        }
        return data;
    }
}

class Avatars {
    String large;
    String medium;
    String small;

    Avatars({this.large, this.medium, this.small});

    factory Avatars.fromJson(Map<String, dynamic> json) {
        return Avatars(
            large: json['large'],
            medium: json['medium'],
            small: json['small'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['large'] = this.large;
        data['medium'] = this.medium;
        data['small'] = this.small;
        return data;
    }
}

class Images {
    String large;
    String medium;
    String small;

    Images({this.large, this.medium, this.small});

    factory Images.fromJson(Map<String, dynamic> json) {
        return Images(
            large: json['large'],
            medium: json['medium'],
            small: json['small'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['large'] = this.large;
        data['medium'] = this.medium;
        data['small'] = this.small;
        return data;
    }
}

class Cast {
    String alt;
    Avatars avatars;
    String id;
    String name;
    String name_en;

    Cast({this.alt, this.avatars, this.id, this.name, this.name_en});

    factory Cast.fromJson(Map<String, dynamic> json) {
        return Cast(
            alt: json['alt'],
            avatars: json['avatars'] != null ? Avatars.fromJson(json['avatars']) : null,
            id: json['id'],
            name: json['name'],
            name_en: json['name_en'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alt'] = this.alt;
        data['id'] = this.id;
        data['name'] = this.name;
        data['name_en'] = this.name_en;
        if (this.avatars != null) {
            data['avatars'] = this.avatars.toJson();
        }
        return data;
    }
}

class AvatarsX {
    String large;
    String medium;
    String small;

    AvatarsX({this.large, this.medium, this.small});

    factory AvatarsX.fromJson(Map<String, dynamic> json) {
        return AvatarsX(
            large: json['large'],
            medium: json['medium'],
            small: json['small'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['large'] = this.large;
        data['medium'] = this.medium;
        data['small'] = this.small;
        return data;
    }
}

class Rating {
    double average;
    Details details;
    int max;
    int min;
    String stars;

    Rating({this.average, this.details, this.max, this.min, this.stars});

    factory Rating.fromJson(Map<String, dynamic> json) {
        return Rating(
            average: json['average']?.toDouble(),
//            details: json['details'] != null ? Details.fromJson(json['details']) : null,
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
//            data['details'] = this.details.toJson();
        }
        return data;
    }
}

class Details {
//    double 1;
//    double 2;
//    double 3;
//    double 4;
//    double 5;

//    Details({this.1, this.2, this.3, this.4, this.5});
//
//    factory Details.fromJson(Map<String, dynamic> json) {
//        return Details(
//            1: json['1'],
//            2: json['2'],
//            3: json['3'],
//            4: json['4'],
//            5: json['5'],
//        );
//    }
//
//    Map<String, dynamic> toJson() {
//        final Map<String, dynamic> data = new Map<String, dynamic>();
//        data['1'] = this.1;
//        data['2'] = this.2;
//        data['3'] = this.3;
//        data['4'] = this.4;
//        data['5'] = this.5;
//        return data;
//    }
}