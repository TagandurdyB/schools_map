import 'package:device_preview/device_preview.dart';
import 'config/core/exports.dart';
import 'injector.dart';

void run() {
  runApp(
    const Injector(MyApp()),
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const Injector(MyApp()),
    // ),
  );
}

const bool isProduction = bool.fromEnvironment('dart.vm.product');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (isProduction) {
    // debugPrint = (String? message, {int? wrapWidth}) {};
  }
  await Boxes.init();
  // await PermisService.requestPermis(Permis.microphone);
  await MyStorage.init();
  run();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            OrientationBuilder(builder: (context, orientation) {
              context.read<ResponsiveCubit>().changeValues(
                    constraints: constraints,
                    orientation: orientation,
                  );
              cc = TC(context);
              return LifecycleManager(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Aşgabat Arkadag',
                  themeMode: ThemeCubit.of(context).mode,
                  theme: MyTheme.light,
                  darkTheme: MyTheme.dark,
                  onGenerateRoute: AppRoute.onGenerateRoute,
                  navigatorKey: AppRoute.mainNavKey,
                  builder: FToastBuilder(),
                ),
              );
            }));
  }
}
