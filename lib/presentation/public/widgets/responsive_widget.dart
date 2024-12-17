import '../../../config/core/exports.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget Function(
    Orientation orientation,
    BoxConstraints constraints,
    Device device,
  )? builder;
  const ResponsiveWidget({
    this.builder,
    this.mobile = const SizedBox(),
    this.tablet,
    this.desktop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.watch<ResponsiveCubit>().state.when(
          loading: () => const LoadingWidget(),
          ready: (orientation, constraints, device) {
            if (builder != null) {
              return builder!(orientation, constraints, device);
            }
            switch (device) {
              case Device.desktop:
                return desktop ?? tablet ?? mobile;
              case Device.tablet:
                return tablet ?? mobile;
              default:
                return mobile;
            }
          },
        );
  }
}
