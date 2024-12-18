import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/features/analytics/data/models/analytic_model.dart';
import 'package:easy_pms/features/analytics/presentation/bloc/bloc/analytics_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnaluticsScreenState();
}

class _AnaluticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalyticsBloc()..add(GetAnalyticsEvent()),
      child: BlocConsumer<AnalyticsBloc, AnalyticsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AnalyticsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AnalyticsLoaded) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Theme.of(context).primaryColor),
                    child: PieChart(
                        PieChartData(sections: pieChartSections(state.model))),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profit from tariffs',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${state.model.priceFromReservation}USD',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profit from services',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${state.model.priceFromServices}USD',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 25),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          if (state is AnalyticsFailure) {
            return const Center(
              child: Text('Ошибка'),
            );
          }
          return Container();
        },
      ),
    );
  }

  List<PieChartSectionData> pieChartSections(AnalyticModel model) {
    const List<Color> colors = [
      Color(0xFF6FD195),
      Color(0xFFFF928A),
    ];
    List<int> values = [
      model.priceFromReservation ?? 0,
      model.priceFromServices ?? 0
    ];
    return List.generate(2, (index) {
      return PieChartSectionData(
          color: colors[index], radius: 100, value: values[index].toDouble());
    });
  }
}
