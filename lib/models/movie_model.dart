import 'dart:convert';

class SeatModel {
  final int setId;
  final int? bookingId;
  final String seatNum;
  final String status;
  final String? coustomarName;

  SeatModel({
    required this.setId,
    this.bookingId,
    required this.seatNum,
    required this.status,
    this.coustomarName,
  });
}

class MoviesData {
  final int id;
  final String name;
  final String postarURL;
  final String showDate;
  final String showTime;
  List<SeatModel> sets;

  MoviesData({
    required this.id,
    required this.name,
    required this.postarURL,
    required this.showDate,
    required this.showTime,
    required this.sets,
  });
}

class MovieModel {
  final String status;
  final String masseg;
  final List<MoviesData> movis;

  MovieModel({required this.status, required this.masseg, required this.movis});
  factory MovieModel.fromjson(Map jason) {
    return MovieModel(
      status: jason['status'],
      masseg: jason['masseg'],
      movis: jason['data']
          .Map(
            (e) => MoviesData(
              id: e['id'],
              name: e['name'],
              postarURL: e['postar'],
              showDate: e['showDate'],
              showTime: e['showTime'],
              sets: e['seats']
                  .Map(
                    (s) => SeatModel(
                      setId: s['seatId'],
                      seatNum: s['seatNumber'],
                      status: s['status'],
                      bookingId: s['bookingId'] ?? -1,
                      coustomarName: s['customerName'] ?? "",
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}
