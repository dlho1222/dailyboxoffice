class MovieDetailModel {
  final MovieInfoResult movieInfoResult;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : movieInfoResult = MovieInfoResult.fromJson(json['movieInfoResult']);
}

class MovieInfoResult {
  final MovieInfo movieInfo;
  final String source;

  MovieInfoResult.fromJson(Map<String, dynamic> json)
      : movieInfo = MovieInfo.fromJson(json['movieInfo']),
        source = json['source'];
}

class MovieInfo {
  final String? movieCd,
      movieNm,
      movieNmEn,
      movieNmOg,
      showTm,
      prdtYear,
      openDt,
      prdStatNm,
      typeNm;
  final List<Nations>? nations;
  final List<Genres>? genres;
  final List<Directors>? directors;
  final List<Actors>? actors;
  final List<Companys>? companys;
  final List<Audits>? audits;
  final List<Staffs>? staffs;
  final List<ShowTypes>? showTypes;
  MovieInfo.fromJson(Map<String, dynamic> json)
      : movieCd = json['movieCd'],
        movieNm = json['movieNm'],
        movieNmEn = json['movieNmEn'],
        movieNmOg = json['movieNmOg'],
        showTm = json['showTm'],
        prdtYear = json['prdtYear'],
        openDt = json['openDt'],
        prdStatNm = json['prdStatNm'],
        typeNm = json['typeNm'],
        nations =
            (json['nations'] as List).map((e) => Nations.fromJson(e)).toList(),
        genres =
            (json['genres'] as List).map((e) => Genres.fromJson(e)).toList(),
        directors = (json['directors'] as List)
            .map((e) => Directors.fromJson(e))
            .toList(),
        actors =
            (json['actors'] as List).map((e) => Actors.fromJson(e)).toList(),
        showTypes = (json['showTypes'] as List)
            .map((e) => ShowTypes.fromJson(e))
            .toList(),
        companys = (json['companys'] as List)
            .map((e) => Companys.fromJson(e))
            .toList(),
        audits =
            (json['audits'] as List).map((e) => Audits.fromJson(e)).toList(),
        staffs =
            (json['staffs'] as List).map((e) => Staffs.fromJson(e)).toList();
}

class ShowTypes {
  String? showTypeGroupNm, showTypeNm;
  ShowTypes.fromJson(Map<String, dynamic> json)
      : showTypeGroupNm = json['showTypeGroupNm'],
        showTypeNm = json['showTypeNm'];
}

class Staffs {
  final String? peopleNm, peopleNmEn, staffRoleNm;

  Staffs.fromJson(Map<String, dynamic> json)
      : peopleNm = json['peopleNm'],
        peopleNmEn = json['peopleNmEn'],
        staffRoleNm = json['staffRoleNm'];
}

class Audits {
  final String? auditNo, watchGradeNm;

  Audits.fromJson(Map<String, dynamic> json)
      : auditNo = json['auditNo'],
        watchGradeNm = json['watchGradeNm'];
}

class Companys {
  final String? companyCd, companyNm, companyNmEn, companyPartNm;

  Companys.fromJson(Map<String, dynamic> json)
      : companyCd = json['companyCd'],
        companyNm = json['companyNm'],
        companyNmEn = json['companyNmEn'],
        companyPartNm = json['companyPartNm'];
}

class Actors {
  String? peopleNm, peopleNmEn, cast, castEn;

  Actors.fromJson(Map<String, dynamic> json)
      : peopleNm = json['peopleNm'],
        peopleNmEn = json['peopleNmEn'],
        cast = json['cast'],
        castEn = json['castEn'];
}

class Directors {
  final String? peopleNm, peopleNmEn;

  Directors.fromJson(Map<String, dynamic> json)
      : peopleNm = json['peopleNm'],
        peopleNmEn = json['peopleNmEn'];
}

class Genres {
  final String? genreNm;

  Genres.fromJson(Map<String, dynamic> json) : genreNm = json['genreNm'];
}

class Nations {
  final String? nationNm;

  Nations.fromJson(Map<String, dynamic> json) : nationNm = json['nationNm'];
}
