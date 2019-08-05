import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:selena_app/bloc/DetailDataBloc.dart';
import 'package:selena_app/model/response/DetailDataResponse.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.slug}) : super(key: key);

  final String slug;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    detailDataBloc.getDetailData(widget.slug);
  }

  GoogleMapController mapController;

  Widget build(BuildContext context) {
    String formatDate(String date) {
      Intl.defaultLocale = 'id';
      final formatDate = DateFormat("dd MMMM yyyy");
      String result = formatDate.format(DateTime.parse(date));
      return result;
    }

    Completer<GoogleMapController> _controller = Completer();

    const LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    Widget buildBody(BuildContext ctxt, int index, List<ScheduleList> litems) {
      return GestureDetector(
//        onTap: ()=> Navigator.of(context)
//            .push(MaterialPageRoute(builder: (context) => DetailOrder())),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(formatDate(litems[index].activityDate)),
            Radio(value: null, groupValue: null, onChanged: null)
          ],
        ),
      );
    }

    Widget listLokasi(List<ScheduleList> litems) {
      return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: litems !=null ?ListView.builder(
            shrinkWrap: true,
            itemCount: litems.length,
            itemBuilder: (BuildContext ctxt, int index) =>
                buildBody(ctxt, index, litems)) : Text("Tidak Ada Data"),
      );
    }

    return Scaffold(
      body: StreamBuilder<Object>(
          stream: detailDataBloc.getStreamDetailData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Data data = snapshot.data;
              Set<Marker> markers = Set();
              markers.addAll([
                Marker(
                    markerId: MarkerId('position'),
                    position: LatLng(data.latitude, data.longitude))
              ]);
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(data.mainImage.original),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                      ),
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    FloatingActionButton(
                                      child: new Icon(Icons.chevron_left),
                                      backgroundColor: Colors.grey,
                                      onPressed: () => {},
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    FloatingActionButton(
                                      child: new Icon(Icons.cloud_download),
                                      backgroundColor: Colors.grey,
                                      onPressed: () => {},
                                    ),
                                    FloatingActionButton(
                                      child: new Icon(Icons.favorite_border),
                                      backgroundColor: Colors.grey,
                                      onPressed: () => {},
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ],
                            ),
                            Center(
                                child: new Row(children: <Widget>[
                              new Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        data.category.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        data.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.grey,
                                            ),
                                            Flexible(
                                              child: Text(
                                                " ${data.detailAddress}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.date_range,
                                              color: Colors.grey,
                                            ),
                                            data.scheduleList != null
                                                ? Text(
                                                    " ${formatDate(data.scheduleList[0].activityDate)}",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15.0,
                                                    ),
                                                  )
                                                : Text(
                                                    " Tidak Ada Data Ditampilkan",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.timer,
                                              color: Colors.grey,
                                            ),
                                            data.scheduleList != null
                                                ? Text(
                                                    " ${data.scheduleList[0].duration}",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15.0),
                                                  )
                                                : Text(
                                                    " Tidak ada Data Ditampilkan",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15.0),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]))
                          ],
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.grey.withOpacity(0.0),
                                  Colors.black,
                                ],
                                stops: [
                                  0.0,
                                  1.0
                                ])),
                      )
                    ]),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Host dari : "),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 0.0),
                                        child: Text(
                                          data.host.name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        'https://i2-prod.mirror.co.uk/incoming/article18781881.ece/ALTERNATES/s615/0_Cristiano-Ronaldo-teams-up-with-his-Juventus-team-mates-to-launch-new-jersey-in-Shanghai.jpg'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Deskripsi",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Html(
                            data: data.description,
                            padding: EdgeInsets.all(8.0),
                            onLinkTap: (url) {
                              print("Opening $url...");
                            },
                            customRender: (node, children) {
                              if (node is dom.Element) {
                                switch (node.localName) {
                                  case "custom_tag": // using this, you can handle custom tags in your HTML
                                    return Column(children: children);
                                }
                              }
                            },
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Terms",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Html(
                            data: data.notes,
                            padding: EdgeInsets.all(8.0),
                            onLinkTap: (url) {
                              print("Opening $url...");
                            },
                            customRender: (node, children) {
                              if (node is dom.Element) {
                                switch (node.localName) {
                                  case "custom_tag": // using this, you can handle custom tags in your HTML
                                    return Column(children: children);
                                }
                              }
                            },
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Lokasi",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(data.address),
                          Container(
                            height: 100,
                            child: GoogleMap(
                              onMapCreated: (GoogleMapController controller) {
                                mapController = controller;
                              },
                              markers: markers,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(data.latitude, data.longitude),
                                zoom: 11.0,
                              ),
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              "Jadwal Yang Tersedia",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              height: 150,
                              child: listLokasi(data.scheduleList)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
