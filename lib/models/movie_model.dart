class MovieModel {
  final BoxOfficeResult boxOfficeResult;
  MovieModel.fromJson(Map<String, dynamic> json)
      : boxOfficeResult = BoxOfficeResult.fromJson(json['boxOfficeResult']);
}

class BoxOfficeResult {
  final String boxofficeType, showRange;
  final List<DailyBoxOfficeList> dailyBoxOfficeList;
  BoxOfficeResult.fromJson(Map<String, dynamic> json)
      : boxofficeType = json['boxofficeType'],
        showRange = json['showRange'],
        dailyBoxOfficeList = (json['dailyBoxOfficeList'] as List)
            .map((e) => DailyBoxOfficeList.fromJson(e))
            .toList();
}

class DailyBoxOfficeList {
  final String rnum,
      rank,
      rankInten,
      rankOldAndNew,
      movieCd,
      movieNm,
      openDt,
      salesAmt,
      salesShare,
      salesInten,
      salesChange,
      salesAcc,
      audiCnt,
      audiInten,
      audiChange,
      audiAcc,
      scrnCnt,
      showCnt;
  DailyBoxOfficeList.fromJson(Map<String, dynamic> json)
      : rnum = json['rnum'],
        rank = json['rank'],
        rankInten = json['rankInten'],
        rankOldAndNew = json['rankOldAndNew'],
        movieCd = json['movieCd'],
        movieNm = json['movieNm'],
        openDt = json['openDt'],
        salesAmt = json['salesAmt'],
        salesShare = json['salesShare'],
        salesInten = json['salesInten'],
        salesChange = json['salesChange'],
        salesAcc = json['salesAcc'],
        audiCnt = json['audiCnt'],
        audiInten = json['audiInten'],
        audiChange = json['audiChange'],
        audiAcc = json['audiAcc'],
        scrnCnt = json['scrnCnt'],
        showCnt = json['showCnt'];
}
