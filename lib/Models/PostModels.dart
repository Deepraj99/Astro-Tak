class PostModel {
  PostModel({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
  });
  late final String httpStatus;
  late final num httpStatusCode;
  late final bool success;
  late final String message;
  late final String apiName;
  late final List<PostModelData> data;

  PostModel.fromJson(Map<dynamic, dynamic> json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    apiName = json['apiName'];
    data =
        List.from(json['data']).map((e) => PostModelData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['httpStatus'] = httpStatus;
    _data['httpStatusCode'] = httpStatusCode;
    _data['success'] = success;
    _data['message'] = message;
    _data['apiName'] = apiName;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PostModelData {
  PostModelData({
    required this.id,
    required this.urlSlug,
    this.namePrefix,
    required this.firstName,
    required this.lastName,
    this.aboutMe,
    this.profliePicUrl,
    required this.experience,
    required this.languages,
    required this.minimumCallDuration,
    required this.minimumCallDurationCharges,
    required this.additionalPerMinuteCharges,
    required this.isAvailable,
    required this.rating,
    required this.skills,
    required this.isOnCall,
    required this.freeMinutes,
    required this.additionalMinute,
    required this.images,
    this.availability,
  });
  late final num id;
  late final String urlSlug;
  late final String? namePrefix;
  late final String firstName;
  late final String lastName;
  late final String? aboutMe;
  late final Null profliePicUrl;
  late final num experience;
  late final List<Languages> languages;
  late final num minimumCallDuration;
  late final num minimumCallDurationCharges;
  late final num additionalPerMinuteCharges;
  late final bool isAvailable;
  late final num? rating;
  late final List<Skills> skills;
  late final bool isOnCall;
  late final num freeMinutes;
  late final num additionalMinute;
  late final Images images;
  late final Availability? availability;

  PostModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlSlug = json['urlSlug'];
    namePrefix = null;
    firstName = json['firstName'];
    lastName = json['lastName'];
    aboutMe = null;
    profliePicUrl = null;
    experience = json['experience'];
    languages =
        List.from(json['languages']).map((e) => Languages.fromJson(e)).toList();
    minimumCallDuration = json['minimumCallDuration'];
    minimumCallDurationCharges = json['minimumCallDurationCharges'];
    additionalPerMinuteCharges = json['additionalPerMinuteCharges'];
    isAvailable = json['isAvailable'];
    rating = null;
    skills = List.from(json['skills']).map((e) => Skills.fromJson(e)).toList();
    isOnCall = json['isOnCall'];
    freeMinutes = json['freeMinutes'];
    additionalMinute = json['additionalMinute'];
    images = Images.fromJson(json['images']);
    availability = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['urlSlug'] = urlSlug;
    _data['namePrefix'] = namePrefix;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['aboutMe'] = aboutMe;
    _data['profliePicUrl'] = profliePicUrl;
    _data['experience'] = experience;
    _data['languages'] = languages.map((e) => e.toJson()).toList();
    _data['minimumCallDuration'] = minimumCallDuration;
    _data['minimumCallDurationCharges'] = minimumCallDurationCharges;
    _data['additionalPerMinuteCharges'] = additionalPerMinuteCharges;
    _data['isAvailable'] = isAvailable;
    _data['rating'] = rating;
    _data['skills'] = skills.map((e) => e.toJson()).toList();
    _data['isOnCall'] = isOnCall;
    _data['freeMinutes'] = freeMinutes;
    _data['additionalMinute'] = additionalMinute;
    _data['images'] = images.toJson();
    _data['availability'] = availability;
    return _data;
  }
}

class Languages {
  Languages({
    required this.id,
    required this.name,
  });
  late final num id;
  late final String name;

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Skills {
  Skills({
    required this.id,
    required this.name,
    required this.description,
  });
  late final num id;
  late final String name;
  late final String description;

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    return _data;
  }
}

class Images {
  Images({
    required this.small,
    required this.large,
    required this.medium,
  });
  late final Small small;
  late final Large large;
  late final Medium medium;

  Images.fromJson(Map<String, dynamic> json) {
    small = Small.fromJson(json['small']);
    large = Large.fromJson(json['large']);
    medium = Medium.fromJson(json['medium']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['small'] = small.toJson();
    _data['large'] = large.toJson();
    _data['medium'] = medium.toJson();
    return _data;
  }
}

class Small {
  Small({
    this.imageUrl,
    this.id,
  });
  late final Null imageUrl;
  late final Null id;

  Small.fromJson(Map<String, dynamic> json) {
    imageUrl = null;
    id = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imageUrl'] = imageUrl;
    _data['id'] = id;
    return _data;
  }
}

class Large {
  Large({
    required this.imageUrl,
    required this.id,
  });
  late final String imageUrl;
  late final num id;

  Large.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imageUrl'] = imageUrl;
    _data['id'] = id;
    return _data;
  }
}

class Medium {
  Medium({
    required this.imageUrl,
    required this.id,
  });
  late final String imageUrl;
  late final num id;

  Medium.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imageUrl'] = imageUrl;
    _data['id'] = id;
    return _data;
  }
}

class Availability {
  Availability({
    required this.days,
    required this.slot,
  });
  late final List<String> days;
  late final Slot slot;

  Availability.fromJson(Map<String, dynamic> json) {
    days = List.castFrom<dynamic, String>(json['days']);
    slot = Slot.fromJson(json['slot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['days'] = days;
    _data['slot'] = slot.toJson();
    return _data;
  }
}

class Slot {
  Slot({
    required this.toFormat,
    required this.fromFormat,
    required this.from,
    required this.to,
  });
  late final String toFormat;
  late final String fromFormat;
  late final String from;
  late final String to;

  Slot.fromJson(Map<String, dynamic> json) {
    toFormat = json['toFormat'];
    fromFormat = json['fromFormat'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['toFormat'] = toFormat;
    _data['fromFormat'] = fromFormat;
    _data['from'] = from;
    _data['to'] = to;
    return _data;
  }
}
