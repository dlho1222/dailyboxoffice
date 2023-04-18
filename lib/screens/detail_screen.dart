import 'package:dailyboxoffice/models/movie_detail_model.dart';
import 'package:dailyboxoffice/screens/actors.screen.dart';
import 'package:dailyboxoffice/screens/staffs.screen.dart';
import 'package:dailyboxoffice/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.movieCd}) : super(key: key);
  final String movieCd;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextStyle textSize = const TextStyle(fontSize: 18);
  late Future<MovieDetailModel> detailInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailInfo = ApiService.getDetailInfo(widget.movieCd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        title: const Text(
          '영화 상세',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: detailInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieDetail = snapshot.data!;
            List<Actors>? actors =
                snapshot.data!.movieInfoResult.movieInfo.actors;
            List<Staffs>? staffs =
                snapshot.data!.movieInfoResult.movieInfo.staffs;
            directorInfo() async {
              await launchUrlString(
                  'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${snapshot.data!.movieInfoResult.movieInfo.directors![0].peopleNm}');
            }

            var showTime = movieDetail.movieInfoResult.movieInfo.showTm;
            var showTm = int.parse(showTime!);
            var openDt = movieDetail.movieInfoResult.movieInfo.openDt;

            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "영화제목 : ${movieDetail.movieInfoResult.movieInfo.movieNm}",
                  style: textSize,
                ),
                const Divider(thickness: 2),
                Container(
                  height: 50,
                  child: ListView.builder(
                    itemCount:
                        movieDetail.movieInfoResult.movieInfo.genres!.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${movieDetail.movieInfoResult.movieInfo.genres![index].genreNm}',
                            style: textSize,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Divider(thickness: 2),
                Text(
                  "심의정보 : ${movieDetail.movieInfoResult.movieInfo.audits![0].watchGradeNm}",
                  style: textSize,
                ),
                const Divider(thickness: 2),
                Text(
                  "상영시간 : ${(showTm / 60).toInt()}시간 ${showTm % 60}분 / 영화유형 : ${movieDetail.movieInfoResult.movieInfo.typeNm}",
                  style: textSize,
                ),
                const Divider(thickness: 2),
                Text(
                  "개봉일 : ${openDt!.substring(0, 4)}년 ${openDt!.substring(4, 6)}월 ${openDt!.substring(6, 8)}일",
                  style: textSize,
                ),
                const Divider(thickness: 2),
                Text(
                  "제작연도 : ${movieDetail.movieInfoResult.movieInfo.prdtYear}",
                  style: textSize,
                ),
                const Divider(thickness: 2),
                Text(
                  "제작국가 : ${movieDetail.movieInfoResult.movieInfo.nations![0].nationNm}",
                  style: textSize,
                ),
                const Divider(thickness: 2),
                ListTile(
                  onTap: directorInfo,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "감독 : ${movieDetail.movieInfoResult.movieInfo.directors![0].peopleNm}",
                        style: const TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                Container(
                  height: 70,
                  child: ListView.builder(
                    itemCount: snapshot
                        .data!.movieInfoResult.movieInfo.showTypes!.length,
                    itemBuilder: (context, index) {
                      var showType =
                          snapshot.data!.movieInfoResult.movieInfo.showTypes;
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              '${showType![index].showTypeNm} / ${showType![index].showTypeGroupNm}',
                              style: textSize,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActorsScreen(
                            actors: actors!.toList(),
                          ),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '출연배우',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaffsScreen(
                            staffs: staffs!.toList(),
                          ),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '스태프',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                Text(
                  '정보제공 : ${snapshot.data!.movieInfoResult.source} , kobis',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
