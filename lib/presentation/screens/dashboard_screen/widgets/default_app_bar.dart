import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../logic/cubit/authentication_cubit.dart';
import '../../../routers/app_router.dart';

NeumorphicAppBar buildDefaultAppBar(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return NeumorphicAppBar(
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => {
                Alert(
                    closeIcon: SizedBox(),
                    context: context,
                    title: 'Log Out?',
                    buttons: [
                      DialogButton(
                          child:
                              Text('Ok', style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            BlocProvider.of<AuthenticationCubit>(context)
                                .signOut()
                                .then((value) => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        AppRouter.login, (_) => false));
                          }),
                      DialogButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ]).show()
              })
    ],
    centerTitle: true,
    title: Text(
      'Scan-Zeit',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
