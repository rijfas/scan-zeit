import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../core/constants/enums.dart';
import '../../../logic/cubit/authentication_cubit.dart';
import '../../../logic/cubit/visit_recorder_cubit.dart';
import '../../routers/app_router.dart';
import 'widgets/custom_list_view.dart';
import 'widgets/default_app_bar.dart';
import 'widgets/summary_display.dart';

class CustomerDashBoardScreen extends StatelessWidget {
  static const route = 'customer_dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: buildDefaultAppBar(context),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, authState) {
        if (authState is Authenticated) {
          return BlocBuilder<VisitRecorderCubit, VisitRecorderState>(
            builder: (context, state) {
              if (state is VisitRecorderLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is VisitRecorderLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SummaryDisplay(
                        title: '${state.visitRecords.length} Visits',
                        subtitle: '${DateTime.now()}',
                      ),
                    ),
                    Expanded(
                      child: CustomListView(
                        visitRecords: state.visitRecords,
                        uid: authState.user.user.uid,
                        accountType: AccountType.merchant,
                      ),
                    ),
                  ],
                );
              } else if (state is VisitRecorderError) {
                return Center(
                  child: Text('Error While Loading Data..'),
                );
              } else if (state is VisitRecorderRemoved) {
                BlocProvider.of<VisitRecorderCubit>(context)
                    .loadData(uid: authState.user.user.uid);
              }
              return Text('Unknow Error...');
            },
          );
        } else if (authState is AuthenticationDone) {
          return Text('Signed Out..');
        }
        return Text('Unknown Error..');
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt_sharp),
        onPressed: () => Navigator.pushNamed(context, AppRouter.qr_scan),
      ),
    );
  }
}
