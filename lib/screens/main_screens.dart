import 'package:flutte_app/providers/location_provider.dart';
import 'package:flutte_app/screens/weather_report.dart';
import 'package:flutte_app/utils/helpers.dart';
import 'package:flutte_app/utils/styles.dart';
import 'package:flutte_app/widgets/address_card.dart';
import 'package:flutte_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late LocationProvider locationProvider;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  
  }

  var cityName = "";

  Future<void> getData(BuildContext context) async {
      locationProvider = Provider.of<LocationProvider>(context, listen: false);
    locationProvider.updateLocation();
    cityName = await getCityFromCoordinates(
        locationProvider.latitude, locationProvider.longitude);
    debugPrint("City Name : $cityName");
  }

  @override
  Widget build(BuildContext context) {
    if (!locationProvider.isLocationFetched) {
      setState(() {});
    }
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: const Icon(Icons.refresh_rounded),
        ),
        body: FutureBuilder(
          future: getData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Text(
                      "Weather App",
                      style: appTitle.copyWith(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AddressCard(
                      location: cityName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    locationProvider.isLocationFetched
                        ? WeatherReport()
                        : const Loading()
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Loading(),
              );
            }
            return Container();
          },
        ));
  }
}
