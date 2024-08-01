import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/golbal.dart';
import '../../modal/Weather_Modal.dart';
import '../../provider/weather_provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    WeatherProvider weatherProviderTrue = Provider.of(context, listen: true);
    WeatherProvider weatherProviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xff4E40AA),
        backgroundColor: Color(0xff4B5e6d),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (value) {
                  weatherProviderFalse.ImgFind(value);
                  weatherProviderTrue.SearchList.add(
                      weatherProviderTrue.weatherModal?.location.name);
                },
                //controller: SearchText,
                // controller: SearchText,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  focusColor: Colors.white,
                  hintText: 'Enter City Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            FutureBuilder(
              future: Provider.of<WeatherProvider>(context).SearchWeather(
                weatherProviderTrue.search,
              ),
              builder: (context, snapshot) {
                WeatherModal? weatherModal = snapshot.data;
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/weather');
                          },
                          child: Container(
                            height: 190,
                            width: 380,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: Color(0xff1F315A),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                '${weatherModal!.location.name}',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Container(
                                width: width * 0.1,
                                // color: Colors.white,
                                child: Text(
                                  // overflow: TextOverflow.ellipsis,
                                  '${weatherModal.current.temp_c.toString()} '
                                  '\n'
                                  '${weatherModal.current.condition.text}\n',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              trailing: Image(
                                image: NetworkImage(
                                    'https:${weatherModal.current.condition.icon}'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/fav');
          },
          icon: Icon(
            Icons.favorite_border_outlined,
            color: Colors.red,
            size: 50,
          ),
        ),
      ),
    );
  }
}

var Sindex = 1;
//  weatherProviderTrue.Weather.add(
//                             weatherModal.location.name,
//                           );
//                           weatherProviderTrue.Weather1.add(
//                             weatherModal.current.temp_c,
//                           );
