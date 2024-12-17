// import 'package:flutter_map_mbtiles/flutter_map_mbtiles.dart';
// import 'package:mbtiles/mbtiles.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:schools_map/config/core/exports.dart';

import '../../public/scaffold/title_bar.dart';
import '../widgets/school_card.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController mapController = MapController();
  LatLng? myLocation;

  late RegionEntity? region = context.read<NavCubit>().state.region;

  @override
  void initState() {
    LocationService.getCurrentLocation().then((loc) {
      setState(() => myLocation = LatLng(loc.latitude, loc.longitude));
      mapController.moveAndRotate(myLocation!, 14, 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        TitleBar(
          title: 'Karta',
          onBack: () => Go.pop(),
        ),
        Expanded(child: buildMap()),
      ],
    );
  }

  Widget buildMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter:
            myLocation ?? const LatLng(37.94098653144121, 58.377131223678596),
        initialZoom: 14,
        interactionOptions:
            const InteractionOptions(flags: ~InteractiveFlag.doubleTapDragZoom),
      ),
      children: [
        buildTileLayer(),
        buildMarkerLayer(),
      ],
    );
  }

  Widget buildTileLayer() {
    return TileLayer(
      // FMTC.instance('offlineStoreName').getTileProvider(
      //       FMTCTileProviderSettings(
      //         behavior: CacheBehavior.cacheOnly,
      //         cachedValidDuration: const Duration(days: 7),
      //         maxStoreLength: 10000,
      //       ),
      //     ),
      urlTemplate: 'https://map.mekdep.org/tile/{z}/{x}/{y}.png',
      // tileProvider: _futureTileProvider,
      tileProvider: CachedTileProvider(
        // maxStale keeps the tile cached for the given Duration and
        // tries to revalidate the next time it gets requested
        maxStale: const Duration(days: 3000),
        store: HiveCacheStore(
          MyStorage.storage,
          hiveBoxName: 'HiveCacheStore',
        ),
      ),
    );
  }

  Widget buildMarkerLayer() {
    return MarkerLayer(markers: [
      if (myLocation != null) buildMe(),
      ...context.watch<SchoolCubit>().state.maybeWhen(
            ready: (schools) {
              final objs = schools[region];
              if (objs?.isEmpty ?? true) {
                return [];
              }
              return [
                // buildSchool(objs[0]),
                for (int i = 0; i < objs!.length; i++)
                  if (objs[i].lat != null && objs[i].long != null)
                    buildSchool(objs[i]),
              ];
            },
            orElse: () => [],
          ),
    ]);
  }

  Marker buildMe() {
    return Marker(
      point: myLocation!,
      width: 24,
      height: 24,
      child: GestureDetector(
        onTap: () {
          mapController.moveAndRotate(myLocation!, 14, 0);
        },
        child: ClipOval(
          child: Container(
            color: cc.cols.blue60,
            padding: const EdgeInsets.all(6),
            child: CircleWidget(
              rad: 24,
              col: cc.cols.canvas,
            ),
          ),
        ),
      ),
    );
  }

  Marker buildSchool(SchoolEntity school) {
    return Marker(
      point: LatLng(school.lat!, school.long!),
      // LatLng(widget.location.latitude, widget.location.longitude),
      rotate: true,
      width: 50,
      height: 60,
      child: GestureDetector(
        onTap: () {
          // MySheet.schoolDetail(context, school: school);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.location_on_rounded,
              size: 50,
              color: cc.cols.orange300,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Icon(
                Icons.school,
                size: 22,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                width: 50,
                child: cc.texts.bodyText(
                  school.name,
                  maxLines: 2,
                  size: 7,
                  align: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
