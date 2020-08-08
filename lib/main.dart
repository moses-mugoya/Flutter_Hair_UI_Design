import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedBarber = 'Jason';
  var selectedDate = 18;
  var selectedTime = '10:00';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        elevation: 0.0,
        title: Text(
          'BOOKING',
          style: GoogleFonts.ubuntu(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                      spreadRadius: 2.0,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 60.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      getDates(18, 'Tue'),
                      SizedBox(width: 25.0),
                      getDates(19, 'Wed'),
                      SizedBox(width: 25.0),
                      getDates(20, 'Thur'),
                      SizedBox(width: 25.0),
                      getDates(21, 'Fri'),
                      SizedBox(width: 25.0),
                      getDates(22, 'Sat'),
                      SizedBox(width: 25.0),
                      getDates(23, 'Sun'),
                      SizedBox(width: 25.0),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 25.0),
          Center(
            child: Text(
              'Hagorapt',
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                letterSpacing: 2.0,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              getServices('Beards', 50),
              getServices('Crew Cut', 15),
            ],
          ),
          SizedBox(height: 15.0),
          Container(
            height: 175.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              children: <Widget>[
                getBarber('assets/black1.jpg', 'Peter'),
                SizedBox(width: 15.0),
                getBarber('assets/black2.jpg', 'Jason'),
                SizedBox(width: 15.0),
                getBarber('assets/black3.jpg', 'Lamar'),
                SizedBox(width: 15.0),
                getBarber('assets/black4.jpg', 'Chris'),
                SizedBox(width: 15.0),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            height: 60.0,
            child: ListView(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getTimes('10:00'),
                SizedBox(width: 25.0),
                getTimes('11:00'),
                SizedBox(width: 25.0),
                getTimes('12:00'),
                SizedBox(width: 25.0),
                getTimes('13:00'),
                SizedBox(width: 25.0),
                getTimes('14:00'),
                SizedBox(width: 25.0),
                getTimes('15:00'),
                SizedBox(width: 25.0),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      'BOOK',
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(color: Colors.grey[800]),
                        child: Center(
                          child: Text(
                            '\$65',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTimes(String displayTime) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      height: 50.0,
      width: 80.0,
      decoration: BoxDecoration(
        color: switchColorTime(displayTime),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: (() {
          selectTime(displayTime);
        }),
        child: Center(
          child: Text(
            displayTime,
            style: GoogleFonts.montserrat(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: switchSelectedContentTime(displayTime),
            ),
          ),
        ),
      ),
    );
  }

  selectTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  Color switchSelectedContentTime(String time) {
    if (time == selectedTime) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color switchColorTime(String time) {
    if (time == selectedTime) {
      return Colors.black.withOpacity(0.8);
    } else {
      return Colors.grey[200];
    }
  }

  Widget getBarber(String imagePath, String name) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                selectBarber(name);
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: getSelectedBarber(name),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  selectBarber(String name) {
    setState(() {
      selectedBarber = name;
    });
  }

  Color getSelectedBarber(String name) {
    if (name == selectedBarber) {
      return Colors.green.withOpacity(0.3);
    } else {
      return Colors.transparent;
    }
  }

  Widget getServices(String cutType, int amount) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            cutType,
            style: GoogleFonts.montserrat(
              fontSize: 17.0,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            "\$" + amount.toString(),
            style: GoogleFonts.montserrat(
              fontSize: 17.0,
              color: Colors.grey,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget getDates(int date, String day) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: switchColor(date),
      ),
      height: 60.0,
      width: 60.0,
      child: InkWell(
        onTap: () {
          selectDate(date);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                date.toString(),
                style: GoogleFonts.ubuntu(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: switchSelectedContent(date),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                day,
                style: GoogleFonts.ubuntu(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: switchSelectedContent(date),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color switchSelectedContent(date) {
    if (date == selectedDate) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color switchColor(date) {
    if (date == selectedDate) {
      return Colors.black.withOpacity(0.8);
    } else {
      return Colors.grey[200];
    }
  }

  selectDate(date) {
    setState(() {
      selectedDate = date;
    });
  }
}
