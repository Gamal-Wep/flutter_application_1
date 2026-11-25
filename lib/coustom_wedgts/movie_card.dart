import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imgeUrl;
  final String titel;
  final String showDate;
  final String showTime;

  MovieCard({
    super.key,
    required this.imgeUrl,
    required this.titel,
    required this.showDate,
    required this.showTime,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Card(
        child: Row(
          children: [
            Image.network(imgeUrl),
            Column(
              children: [
                Text(titel, style: TextStyle(fontWeight: .bold)),
                Row(children: [Icon(Icons.calendar_month), Text(showDate)]),
                Row(children: [Icon(Icons.lock_clock), Text(showTime)]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
