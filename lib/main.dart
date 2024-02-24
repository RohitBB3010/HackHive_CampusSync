import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campus_sync/app/app.dart';

import 'package:campus_sync/app/user_type.dart';
import 'package:campus_sync/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(BlocProvider(create: (context) => AuthCubit(), child: UserType()));
}
