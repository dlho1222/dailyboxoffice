import 'package:dailyboxoffice/models/movie_model.dart';
import 'package:dailyboxoffice/screens/detail_screen.dart';
import 'package:dailyboxoffice/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.today}) : super(key: key);
  String today;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController inputDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<MovieModel> movies = ApiService.getBoxOffice(widget.today);
    onSearch() {
      setState(() {
        widget.today = inputDate.text;
        selectedDate =
            '${inputDate.text.substring(0, 4)}년 ${inputDate.text.substring(4, 6)}월 ${inputDate.text.substring(6, 8)}일 TOP10';
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        title: const Text(
          "DailyBoxOffice",
          style: TextStyle(color: Colors.indigo),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => selectDate(context),
                child: Text(
                  selectedDate,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: '찾을 날짜 Ex) 20230101',
                      border: OutlineInputBorder()),
                  cursorHeight: 30,
                  controller: inputDate,
                ),
              ),
              IconButton(
                  onPressed: onSearch, icon: const Icon(Icons.search_rounded))
            ],
          ),
          FutureBuilder<MovieModel>(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var boxOffice = snapshot
                            .data!.boxOfficeResult.dailyBoxOfficeList[index];
                        var salesAccInt = int.parse(snapshot
                            .data!
                            .boxOfficeResult
                            .dailyBoxOfficeList[index]
                            .salesAcc);
                        var auditCntInt = int.parse(snapshot.data!
                            .boxOfficeResult.dailyBoxOfficeList[index].audiAcc);
                        var comma = NumberFormat('###,###,###,###');
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    movieCd: boxOffice.movieCd,
                                  ),
                                ));
                          },
                          title: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(10, 10),
                                      blurRadius: 15,
                                      color: Colors.black.withOpacity(0.5))
                                ]),
                            child: Text(
                              '${boxOffice.movieNm} \nDailyRank : ${boxOffice.rank}위 \n누적 관객수 : ${comma.format(auditCntInt)} 명 \n누적 매출액 : ${comma.format(salesAccInt)} 원 ',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: snapshot
                          .data!.boxOfficeResult.dailyBoxOfficeList.length),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  String selectedDate =
      (DateFormat("yyyy년 MM월 dd일 TOP 10").format(DateTime.now()));
  Future selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (selected != null) {
      setState(() {
        selectedDate = (DateFormat("yyyy년 MM월 dd일 TOP10").format(selected));
        widget.today = (DateFormat('yyyyMMdd').format(selected));
      });
    }
  }
}
