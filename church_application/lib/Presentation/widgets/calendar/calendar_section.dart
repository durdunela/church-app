import 'package:flutter/material.dart';
import 'package:church_application/Presentation/models/calendar_model.dart';
import 'package:church_application/Presentation/widgets/calendar/calendar_item.dart';

class CalendarSection extends StatelessWidget {
  final List<CalendarModel> calendar;

  const CalendarSection({super.key, required this.calendar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        itemCount: calendar.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20, right: 20),
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemBuilder: (context, index) {
          return CalendarItem(calendarItem: calendar[index]);
        },
      ),
    );
  }
}
