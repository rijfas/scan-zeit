import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_zeit/core/constants/enums.dart';
import '../../../widgets/default_expansion_tile.dart';
import '../../../../logic/cubit/visit_recorder_cubit.dart';
import '../../../../data/models/visit_record.dart';

class CustomListView extends StatelessWidget {
  final List<VisitRecord> visitRecords;
  final String uid;
  final AccountType accountType;
  CustomListView(
      {@required this.visitRecords,
      @required this.uid,
      @required this.accountType});
  @override
  Widget build(BuildContext context) {
    return (visitRecords.length > 0)
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Neumorphic(
                margin: const EdgeInsets.all(10.0),
                child: DefaultExpansionPanel(
                  title: '${visitRecords[index].customer}',
                  subtitle: 'Visited on ${visitRecords[index].time}',
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<VisitRecorderCubit>(context)
                                .removeData(uid: uid, data: {
                              accountType == AccountType.merchant
                                  ? 'customer'
                                  : 'merchant': visitRecords[index].customer,
                              'time': visitRecords[index].time.toString(),
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[400],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: visitRecords.length,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.ac_unit_sharp),
              Text('Wow Such An Empty'),
            ],
          );
  }
}
