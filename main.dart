import 'package:flutter/material.dart';

class Data {
  String kode = "";

  String nama = "";

  String vol = "";

  String turnOver = "";

  String harga = "";

  String naikTurun = "";

  String pctNaikTurun = "";

  Data(String kode, String nama, String vol, String turnOver, String harga,
      String naikTurun, String pctNaikTurun) {
    this.kode = kode;
    this.nama = nama;
    this.vol = vol;
    this.turnOver = turnOver;
    this.harga = harga;
    this.naikTurun = naikTurun;
    this.pctNaikTurun = pctNaikTurun;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Data> dataSahamPerWeek = [
    Data("BBRI", "Bank Rakyat Indonesia", "125M", "605B", "4820", "+80",
        "+2.00%"),
    Data("TLKM", "Telkom Indonesia", "77M", "310B", "4810", "+100", "+2.00%"),
    Data("GOTO", "Gojek Tokopedia", "50M", "210B", "122", "+12", "+3.00%"),
  ];

  List<Data> dataSahamPerDay = [
    Data("BBRI", "Bank Rakyat Indonesia", "125M", "605B", "4820", "+40",
        "+1.00%"),
    Data("TLKM", "Telkom Indonesia", "77M", "310B", "4810", "+30", "+0.6%"),
    Data("GOTO", "Gojek Tokopedia", "50M", "210B", "122", "-4", "-1.00%"),
  ];

  String option1 = "Turn Over";
  String option2 = "Harian";
  String out1 = "";
  String out2 = "";

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> turn = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "Turn Over",
      child: Text("Active Turn Over"),
    );

    var itm2 = const DropdownMenuItem<String>(
      value: "Volume",
      child: Text("Active Volume"),
    );

    turn.add(itm1);
    turn.add(itm2);

    List<DropdownMenuItem<String>> periode = [];
    var prd1 = const DropdownMenuItem<String>(
      value: "Harian",
      child: Text("1D"),
    );

    var prd2 = const DropdownMenuItem<String>(
      value: "Mingguan",
      child: Text("1W"),
    );

    periode.add(prd1);
    periode.add(prd2);

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
            child: Column(
          children: [
            Row(
              children: [
                DropdownButton(
                  value: option1,
                  items: turn,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        itemWidth:
                        200;
                        option1 = newValue;
                      }
                    });
                  },
                  iconSize: 15,
                  elevation: 16,
                  style: TextStyle(color: Colors.grey),
                  underline: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                DropdownButton(
                  value: option2,
                  items: periode,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        itemWidth:
                        100;
                        option2 = newValue;
                      }
                    });
                  },
                  iconSize: 15,
                  elevation: 16,
                  style: TextStyle(color: Colors.grey),
                  underline: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataSahamPerDay.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 3),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                  8), //apply padding to all four sides
                              child: Text(
                                "${dataSahamPerWeek[index].kode}",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  4), //apply padding to all four sides
                              child: Text("Volume"),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  4), //apply padding to all four sides
                              child: Text("Turn Over"),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                  4), //apply padding to all four sides
                              child: Text(
                                "${dataSahamPerDay[index].nama}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  4), //apply padding to all four sides
                              child: Text(
                                "${dataSahamPerDay[index].vol}",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  4), //apply padding to all four sides
                              child: Text(
                                "${dataSahamPerDay[index].turnOver}",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              option2 == "Harian"
                                  ? "${dataSahamPerDay[index].harga}"
                                  : "${dataSahamPerWeek[index].harga}",
                              style: TextStyle(
                                color:
                                    dataSahamPerDay[index].naikTurun[0] == "-"
                                        ? Colors.redAccent
                                        : Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 100,
                                width: 100,
                                color:
                                    dataSahamPerDay[index].naikTurun[0] == "-"
                                        ? Colors.redAccent
                                        : Colors.green,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      option2 == "Harian"
                                          ? "${dataSahamPerDay[index].naikTurun}"
                                          : "${dataSahamPerWeek[index].naikTurun}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      option2 == "Harian"
                                          ? "${dataSahamPerDay[index].pctNaikTurun}"
                                          : "${dataSahamPerWeek[index].pctNaikTurun}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 11'),
            content: const Text(
                'Cantika Putri Arbiliansyah (cantikaputria@upi.edu) ; Muhammad Rayhan Nur (m.rayhan.nur@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
