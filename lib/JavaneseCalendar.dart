import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JavaneseCalendar extends StatefulWidget {
  @override
  _JavaneseCalendarState createState() => _JavaneseCalendarState();
}

class _JavaneseCalendarState extends State<JavaneseCalendar> {
  DateTime currentDate = DateTime.now(); // Displayed month and year
  DateTime today = DateTime.now(); // Constant for today's date

  // Function to move to the next month
  void _nextMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + 1);
    });
  }

  // Function to move to the previous month
  void _previousMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    String javaneseMonth = _getJavaneseMonth(currentDate.month);
    String gregorianMonth = DateFormat('MMMM yyyy').format(currentDate);
    String javaneseYear = "1958 (Za')"; // Example for Javanese year
    String currentDay = DateFormat('EEEE').format(today); // Day name for today (e.g., Tuesday)
    String currentDayNumber = DateFormat('d').format(today); // Day number for today (e.g., 22)
    String todayMonth = DateFormat('MMMM yyyy').format(today); // Today's month

    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.yellow[700],
        child: Padding(
          padding: const EdgeInsets.all(4.0), // Reduced padding
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left Section - Today's Date
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          currentDay,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035, // Reduced text size
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        Text(
                          currentDayNumber,
                          style: TextStyle(
                            fontSize: screenWidth * 0.095, // Slightly reduced size
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        Text(
                          todayMonth, // Display today's month below the date
                          style: TextStyle(
                            fontSize: screenWidth * 0.03, // Slightly reduced size
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        Text(
                          '25 Wage', // Example Javanese date for the current day
                          style: TextStyle(
                            fontSize: screenWidth * 0.025, // Further reduced size
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right Section - Calendar and Month Navigation
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_left, color: Colors.blue[900]),
                              onPressed: _previousMonth, // Navigate to the previous month
                            ),
                            Column(
                              children: [
                                Text(
                                  gregorianMonth,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035, // Further reduced text size
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                ),
                                Text(
                                  javaneseYear,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03, // Slightly reduced size
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue[900],
                                  ),
                                ),
                                Text(
                                  javaneseMonth,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03, // Adjusted size
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue[900],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_right, color: Colors.blue[900]),
                              onPressed: _nextMonth, // Navigate to the next month
                            ),
                          ],
                        ),
                        SizedBox(height: 6), // Reduced height for spacing
                        _buildDayGrid(screenWidth), // Adjusted to remove height constraints
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to return the Javanese month based on the current month
  String _getJavaneseMonth(int month) {
    List<String> javaneseMonths = [
      'Sura', 'Sapar', 'Mulud', 'Bakda Mulud', 'Jumadil Awal', 'Jumadil Akhir',
      'Rejeb', 'Ruwah', 'Pasa', 'Sawal', 'Dulkaidah', 'Besar'
    ];
    return javaneseMonths[month - 1];
  }

  // Build day grid for the calendar
  Widget _buildDayGrid(double screenWidth) {
    List<Widget> days = [];
    int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      bool isToday = i == today.day && currentDate.month == today.month && currentDate.year == today.year;

      days.add(
        Container(
          margin: EdgeInsets.all(1), // Reduced margin for each day
          decoration: isToday
              ? BoxDecoration(
                  color: Colors.blue[300], // Highlight today's date
                  borderRadius: BorderRadius.circular(5),
                )
              : null, // No special decoration for non-today dates
          child: Column(
            children: [
              Text(
                '$i', // Gregorian day
                style: TextStyle(
                  fontSize: screenWidth * 0.028, // Further reduced font size
                  fontWeight: FontWeight.bold,
                  color: isToday ? Colors.white : Colors.blue[900], // Change color for today
                ),
              ),
              Text(
                'Wage', // Example Javanese day (should be dynamically assigned)
                style: TextStyle(
                  fontSize: screenWidth * 0.022, // Further reduced font size
                  color: isToday ? Colors.white : Colors.red[600], // Change color for today
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Return the GridView without setting any fixed height constraints
    return GridView.count(
      crossAxisCount: 7, // 7 days per week
      crossAxisSpacing: 2, // Reduced spacing
      mainAxisSpacing: 2, // Reduced spacing
      shrinkWrap: true, // Ensure the GridView only takes up necessary space
      physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
      children: days,
    );
  }
}
