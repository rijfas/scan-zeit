import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scan_zeit/core/constants/enums.dart';
import 'package:scan_zeit/core/misc/formatters.dart';
import 'package:url_launcher/url_launcher.dart';
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
    final Size size = MediaQuery.of(context).size;
    return (visitRecords.length > 0)
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Neumorphic(
                margin: const EdgeInsets.all(10.0),
                child: DefaultExpansionPanel(
                  title: '${visitRecords[index].id}',
                  subtitle:
                      'Visited on ${Formatters.formatDateFull(visitRecords[index].time)}',
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (await canLaunch(
                                'tel:${visitRecords[index].mobileNumber}'))
                              await launch(
                                  'tel:${visitRecords[index].mobileNumber}');
                          },
                          icon: Icon(
                            Icons.call,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<VisitRecorderCubit>(context)
                                .removeData(uid: uid, data: <String, String>{
                              'id': visitRecords[index].id,
                              'mobile_number': visitRecords[index].mobileNumber,
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
              NeumorphicIcon(Icons.tour,
                  style: NeumorphicStyle(depth: 2.0), size: size.height * 0.2),
              SizedBox(height: 10.0),
              NeumorphicText(
                'No visits so far..',
                textStyle: NeumorphicTextStyle(fontSize: size.height * 0.03),
                style: NeumorphicStyle(depth: 1.3),
              ),
            ],
          );
  }
}
