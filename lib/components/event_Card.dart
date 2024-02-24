import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/consts/padding_margins.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard(
      {super.key,
      required this.eventName,
      required this.committeeName,
      required this.venue,
      required this.schedule});
  final String eventName;
  final String committeeName;
  final String venue;
  final DateTime? schedule;

  String formatDateTime(DateTime dateTime) {
    String formattedTime =
        "${dateTime.hour % 12}:${dateTime.minute.toString().padLeft(2, '0')}";

    String amPm = dateTime.hour < 12 ? 'am' : 'pm';

    String formattedDate =
        "${dateTime.day} ${_getMonthName(dateTime.month)}, ${dateTime.year}";

    return "$formattedTime $amPm $formattedDate";
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical_1(context),
          horizontal: paddingHorizontal_3(context),
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.8),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.32,
              height: MediaQuery.of(context).size.height * 1.48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.black.withOpacity(0.8))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: paddingVertical_1(context),
                  horizontal: paddingHorizontal_2(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    eventName,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  AutoSizeText(
                    committeeName,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  AutoSizeText(
                    formatDateTime(schedule!),
                    maxLines: 1,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  AutoSizeText(
                    venue,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
