/// 演员
class MovieActor {
    String alt;
    Avatars avatars;
    String id;
    String name;
    String name_en;

    MovieActor({this.alt, this.avatars, this.id, this.name, this.name_en});

    factory MovieActor.fromJson(Map<String, dynamic> json) {
        return MovieActor(
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