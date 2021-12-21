class PanchangPostModel {
  PanchangPostModel({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
  });
  late final String httpStatus;
  late final int httpStatusCode;
  late final bool success;
  late final String message;
  late final String apiName;
  late final PanchangData data;

  PanchangPostModel.fromJson(Map<String, dynamic> json) {
    try {
      httpStatus = json['httpStatus'];

      httpStatusCode = json['httpStatusCode'];

      success = json['success'];

      message = json['message'];

      apiName = json['apiName'];
      data = PanchangData.fromJson(json['data']);
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['httpStatus'] = httpStatus;
    _data['httpStatusCode'] = httpStatusCode;
    _data['success'] = success;
    _data['message'] = message;
    _data['apiName'] = apiName;
    _data['data'] = data.toJson();
    return _data;
  }
}

class PanchangData {
  PanchangData({
    required this.day,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.vedicSunrise,
    required this.vedicSunset,
    required this.tithi,
    required this.nakshatra,
    required this.yog,
    required this.karan,
    required this.hinduMaah,
    required this.paksha,
    required this.ritu,
    required this.sunSign,
    required this.moonSign,
    required this.ayana,
    required this.panchangYog,
    required this.vikramSamvat,
    required this.shakaSamvat,
    required this.vkramSamvatName,
    required this.shakaSamvatName,
    required this.dishaShool,
    required this.dishaShoolRemedies,
    required this.nakShool,
    required this.moonNivas,
    required this.abhijitMuhurta,
    required this.rahukaal,
    required this.guliKaal,
    required this.yamghantKaal,
  });
  late final String day;
  late final String sunrise;
  late final String sunset;
  late final String moonrise;
  late final String moonset;
  late final String vedicSunrise;
  late final String vedicSunset;
  late final Tithi tithi;
  late final Nakshatra nakshatra;
  late final Yog yog;
  late final Karan karan;
  late final HinduMaah hinduMaah;
  late final String paksha;
  late final String ritu;
  late final String sunSign;
  late final String moonSign;
  late final String ayana;
  late final String panchangYog;
  late final int vikramSamvat;
  late final int shakaSamvat;
  late final String vkramSamvatName;
  late final String shakaSamvatName;
  late final String dishaShool;
  late final String dishaShoolRemedies;
  late final NakShool nakShool;
  late final String moonNivas;
  late final AbhijitMuhurta abhijitMuhurta;
  late final Rahukaal rahukaal;
  late final GuliKaal guliKaal;
  late final YamghantKaal yamghantKaal;

  PanchangData.fromJson(Map<String, dynamic> json) {
    try {
      day = json['day'];
      sunrise = json['sunrise'];
      sunset = json['sunset'];
      moonrise = json['moonrise'];
      moonset = json['moonset'];
      vedicSunrise = json['vedic_sunrise'];
      vedicSunset = json['vedic_sunset'];
      tithi = Tithi.fromJson(json['tithi']);
      nakshatra = Nakshatra.fromJson(json['nakshatra']);
      yog = Yog.fromJson(json['yog']);
      karan = Karan.fromJson(json['karan']);
      hinduMaah = HinduMaah.fromJson(json['hindu_maah']);
      paksha = json['paksha'];
      ritu = json['ritu'];
      sunSign = json['sun_sign'];
      moonSign = json['moon_sign'];
      ayana = json['ayana'];
      panchangYog = json['panchang_yog'];
      vikramSamvat = json['vikram_samvat'];
      shakaSamvat = json['shaka_samvat'];
      vkramSamvatName = json['vkram_samvat_name'];
      shakaSamvatName = json['shaka_samvat_name'];
      dishaShool = json['disha_shool'];
      dishaShoolRemedies = json['disha_shool_remedies'];
      nakShool = NakShool.fromJson(json['nak_shool']);
      moonNivas = json['moon_nivas'];
      abhijitMuhurta = AbhijitMuhurta.fromJson(json['abhijit_muhurta']);
      rahukaal = Rahukaal.fromJson(json['rahukaal']);
      guliKaal = GuliKaal.fromJson(json['guliKaal']);
      yamghantKaal = YamghantKaal.fromJson(json['yamghant_kaal']);
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    try {
      _data['day'] = day;
      _data['sunrise'] = sunrise;
      _data['sunset'] = sunset;
      _data['moonrise'] = moonrise;
      _data['moonset'] = moonset;
      _data['vedic_sunrise'] = vedicSunrise;
      _data['vedic_sunset'] = vedicSunset;
      _data['tithi'] = tithi.toJson();
      _data['nakshatra'] = nakshatra.toJson();
      _data['yog'] = yog.toJson();
      _data['karan'] = karan.toJson();
      _data['hindu_maah'] = hinduMaah.toJson();
      _data['paksha'] = paksha;
      _data['ritu'] = ritu;
      _data['sun_sign'] = sunSign;
      _data['moon_sign'] = moonSign;
      _data['ayana'] = ayana;
      _data['panchang_yog'] = panchangYog;
      _data['vikram_samvat'] = vikramSamvat;
      _data['shaka_samvat'] = shakaSamvat;
      _data['vkram_samvat_name'] = vkramSamvatName;
      _data['shaka_samvat_name'] = shakaSamvatName;
      _data['disha_shool'] = dishaShool;
      _data['disha_shool_remedies'] = dishaShoolRemedies;
      _data['nak_shool'] = nakShool.toJson();
      _data['moon_nivas'] = moonNivas;
      _data['abhijit_muhurta'] = abhijitMuhurta.toJson();
      _data['rahukaal'] = rahukaal.toJson();
      _data['guliKaal'] = guliKaal.toJson();
      _data['yamghant_kaal'] = yamghantKaal.toJson();
      return _data;
    } catch (e) {
      print(e);
      return _data;
    }
  }

  bool isEmpty() {
    return this.day.length == 0;
  }
}

class Tithi {
  Tithi({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });
  late final Details details;
  late final EndTime endTime;
  late final int endTimeMs;

  Tithi.fromJson(Map<String, dynamic> json) {
    details = Details.fromJson(json['details']);
    endTime = EndTime.fromJson(json['end_time']);
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details.toJson();
    _data['end_time'] = endTime.toJson();
    _data['end_time_ms'] = endTimeMs;
    return _data;
  }
}

class Details {
  Details({
    required this.tithiNumber,
    required this.tithiName,
    required this.special,
    required this.summary,
    required this.deity,
  });
  late final int tithiNumber;
  late final String tithiName;
  late final String special;
  late final String summary;
  late final String deity;

  Details.fromJson(Map<String, dynamic> json) {
    tithiNumber = json['tithi_number'];
    tithiName = json['tithi_name'];
    special = json['special'];
    summary = json['summary'];
    deity = json['deity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tithi_number'] = tithiNumber;
    _data['tithi_name'] = tithiName;
    _data['special'] = special;
    _data['summary'] = summary;
    _data['deity'] = deity;
    return _data;
  }
}

class EndTime {
  EndTime({
    required this.hour,
    required this.minute,
    required this.second,
  });
  late final int hour;
  late final int minute;
  late final int second;

  EndTime.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hour'] = hour;
    _data['minute'] = minute;
    _data['second'] = second;
    return _data;
  }
}

class Nakshatra {
  Nakshatra({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });
  late final Details details;
  late final EndTime endTime;
  late final int endTimeMs;

  Nakshatra.fromJson(Map<String, dynamic> json) {
    details = Details.fromJson(json['details']);
    endTime = EndTime.fromJson(json['end_time']);
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details.toJson();
    _data['end_time'] = endTime.toJson();
    _data['end_time_ms'] = endTimeMs;
    return _data;
  }
}

class Yog {
  Yog({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });
  late final Details details;
  late final EndTime endTime;
  late final int endTimeMs;

  Yog.fromJson(Map<String, dynamic> json) {
    details = Details.fromJson(json['details']);
    endTime = EndTime.fromJson(json['end_time']);
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details.toJson();
    _data['end_time'] = endTime.toJson();
    _data['end_time_ms'] = endTimeMs;
    return _data;
  }
}

class Karan {
  Karan({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });
  late final Details details;
  late final EndTime endTime;
  late final int endTimeMs;

  Karan.fromJson(Map<String, dynamic> json) {
    details = Details.fromJson(json['details']);
    endTime = EndTime.fromJson(json['end_time']);
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details.toJson();
    _data['end_time'] = endTime.toJson();
    _data['end_time_ms'] = endTimeMs;
    return _data;
  }
}

class HinduMaah {
  HinduMaah({
    required this.adhikStatus,
    required this.purnimanta,
    required this.amanta,
    required this.amantaId,
    required this.purnimantaId,
  });
  late final bool adhikStatus;
  late final String purnimanta;
  late final String amanta;
  late final int amantaId;
  late final int purnimantaId;

  HinduMaah.fromJson(Map<String, dynamic> json) {
    adhikStatus = json['adhik_status'];
    purnimanta = json['purnimanta'];
    amanta = json['amanta'];
    amantaId = json['amanta_id'];
    purnimantaId = json['purnimanta_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adhik_status'] = adhikStatus;
    _data['purnimanta'] = purnimanta;
    _data['amanta'] = amanta;
    _data['amanta_id'] = amantaId;
    _data['purnimanta_id'] = purnimantaId;
    return _data;
  }
}

class NakShool {
  NakShool({
    required this.direction,
    required this.remedies,
  });
  late final String direction;
  late final String remedies;

  NakShool.fromJson(Map<String, dynamic> json) {
    direction = json['direction'];
    remedies = json['remedies'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['direction'] = direction;
    _data['remedies'] = remedies;
    return _data;
  }
}

class AbhijitMuhurta {
  AbhijitMuhurta({
    required this.start,
    required this.end,
  });
  late final String start;
  late final String end;

  AbhijitMuhurta.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['start'] = start;
    _data['end'] = end;
    return _data;
  }
}

class Rahukaal {
  Rahukaal({
    required this.start,
    required this.end,
  });
  late final String start;
  late final String end;

  Rahukaal.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['start'] = start;
    _data['end'] = end;
    return _data;
  }
}

class GuliKaal {
  GuliKaal({
    required this.start,
    required this.end,
  });
  late final String start;
  late final String end;

  GuliKaal.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['start'] = start;
    _data['end'] = end;
    return _data;
  }
}

class YamghantKaal {
  YamghantKaal({
    required this.start,
    required this.end,
  });
  late final String start;
  late final String end;

  YamghantKaal.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['start'] = start;
    _data['end'] = end;
    return _data;
  }
}
