import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

class SafeView extends StatelessWidget {
  const SafeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Center(
      child: Column(
        children: <Widget>[
          const AutoSizeText(
            'Oops an error occured !!!',
            maxLines: 1,
            style: TextStyle(fontFamily: 'Euclid', fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              onPressed: context.read<AuthCubit>().returnToLoginPage,
              child: const Text(
                'Return to Login Page',
                style: TextStyle(fontFamily: 'Euclid', fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
