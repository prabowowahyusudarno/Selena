import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:selena_app/bloc/DataBloc.dart';
import 'package:lottie_flutter/lottie_flutter.dart';
import 'package:selena_app/model/response/DataResponse.dart';
import 'package:intl/intl.dart';

import 'DetailPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  LottieComposition _composition;
  String _assetName;
  AnimationController _controller;
  bool _repeat;

  String formatDate(String date) {
    Intl.defaultLocale = 'id';
    final formatDate = DateFormat("dd MMMM yyyy");
    String result = formatDate.format(DateTime.parse(date));
    return result;
  }

  Widget GridLayout(int row, int column, double width, List<Datum> listData) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: listData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(

            child: InkResponse(
              enableFeedback: true,
              child: _getTiles(listData[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailPage(slug : listData[index].slug);
                  }),
                );
              },
            ),
          );
        });
  }

  Widget _getTiles(Datum data) {

    return GridTile(
        child: new InkResponse(
            enableFeedback: true,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: Image.network(
                        data.mainImage.url,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                          child: Text(
                            "Rp. ${data.price}/pax",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: Text(
                            formatDate(data.newDate),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ));
  }

  @override
  void dispose() {
    dataBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();

    _repeat = false;
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1),
      vsync: this,
    );
    _controller.addListener(() => setState(() {}));

    loadAsset('assets/preloader.json').then((LottieComposition composition) {
      setState(() {
        _assetName = 'assets/preloader.json';
        _composition = composition;
        _controller.reset();
      });
    });

    dataBloc.getData();
  }

  Future<LottieComposition> loadAsset(String assetName) async {
    return await rootBundle
        .loadString(assetName)
        .then<Map<String, dynamic>>((String data) => json.decode(data))
        .then((Map<String, dynamic> map) => new LottieComposition.fromMap(map));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://i2-prod.mirror.co.uk/incoming/article18781881.ece/ALTERNATES/s615/0_Cristiano-Ronaldo-teams-up-with-his-Juventus-team-mates-to-launch-new-jersey-in-Shanghai.jpg'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Temukan",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Aktivitas Menyenangkan!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 16.0),
              child: TextField(
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(fontSize: 10.0),
                    hintText: "Cari Workshop atau Open Trip",
                    fillColor: Colors.white),
              ),
            ),
            Text(
              "Kategori",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.orangeAccent,
                      child: Text(
                        "Workshop",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  RaisedButton(
                      color: Colors.grey,
                      child: Text(
                        "Travelling",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  RaisedButton(
                      color: Colors.grey,
                      child: Text(
                        "Watching",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
            ),
            StreamBuilder<Object>(
                stream: dataBloc.getStreamData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: GridLayout(2, 8, width, snapshot.data),
                    );
                  } else if (snapshot.hasError) {
                    return Expanded(
                        child: Center(child: Text(snapshot.error.toString())));
                  }

                  return Expanded(
                      child: Center(child: CircularProgressIndicator()));
//                    child: Lottie(
//                      composition: _composition,
//                      size: const Size(300.0, 300.0),
//                      controller: _controller,
//                    ),
                }),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
