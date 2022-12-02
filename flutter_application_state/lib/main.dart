import 'package:flutter/material.dart';
// import 'package:flutter_application_state/example_provider.dart';

// import 'package:flutter_application_state/riverpod_app.dart';

// import 'package:flutter_application_state/bloc.dart';

// import 'package:flutter_application_state/cubit.dart';

// import 'package:flutter_application_state/flutter_bloc.dart';

//*************** */
// import 'package:flutter_application_state/redux.dart';
// import 'package:redux/redux.dart';
//*************** */

import 'package:flutter_application_state/mob_x.dart';

void main() {
  // runApp(const ProviderApp());
  // runApp(const RiverpodApp());
  // runApp(const BlocApp());
  // runApp(const CubitApp());
  // runApp(const FlutterBlocApp());

  //*************** */
  // final store = Store<int>(counterReducer, initialState: 0);

  // runApp(ReduxApp(
  //   store: store,
  //   title: 'ReduxApp',
  // ));

  //*************** */

  runApp(const MobXApp());
}
