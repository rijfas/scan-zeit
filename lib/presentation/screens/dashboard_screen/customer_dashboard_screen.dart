import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../core/constants/enums.dart';
import '../../../core/misc/formatters.dart';
import '../../../logic/cubit/authentication_cubit.dart';
import '../../../logic/cubit/visit_recorder_cubit.dart';
import '../../routers/app_router.dart';
import '../../widgets/default_error_display.dart';
import 'widgets/custom_list_view.dart';
import 'widgets/default_app_bar.dart';
import 'widgets/summary_display.dart';

class CustomerDashBoardScreen extends StatelessWidget {
  static const route = 'customer_dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDefaultAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                        title:
                            '${state.visitRecords.length} Visit${Formatters.pluralFormat(state.visitRecords.length)}',
                        subtitle:
                            '${Formatters.formatDateHalf(DateTime.now())}',
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
                return DefaultErrorDisplay();
              } else if (state is VisitRecorderRemoved) {
                BlocProvider.of<VisitRecorderCubit>(context)
                    .loadData(uid: authState.user.user.uid);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return DefaultErrorDisplay();
            },
          );
        } else if (authState is AuthenticationDone) {
          return DefaultErrorDisplay();
        }
        return DefaultErrorDisplay();
      }),
      floatingActionButton: NeumorphicFloatingActionButton(
        child: Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.grey[600],
        ),
        onPressed: () => Navigator.pushNamed(context, AppRouter.qr_scan),
      ),
    );
  }
}
