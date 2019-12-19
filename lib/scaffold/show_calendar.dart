import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class ShowCalendar extends StatefulWidget {
  @override
  _ShowCalendarState createState() => _ShowCalendarState();
}

class _ShowCalendarState extends State<ShowCalendar> {
  // Field

  // Method
  Widget showMyCalendar() {

    DateTime currentDateTime = DateTime.now();

    return CalendarCarousel<Event>(
      onDayPressed: (DateTime dateTime, List<Event> event) {
        print('dateTime = $dateTime');

        setState(() {
          currentDateTime = dateTime;
        });

      },

    

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Calender'),
      ),
      body: showMyCalendar(),
    );
  }
}
