import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/components/custom_text_field.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/components/text_button.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:campus_sync/student/login/cubits/check_cubit.dart';
import 'package:campus_sync/student/login/cubits/student_mandatory_fields_cubit.dart';
import 'package:campus_sync/student/login/forms/student_mandatory_field_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentMandatoryFields extends StatelessWidget {
  StudentMandatoryFields({super.key});

  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final clinicPhoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return BlocProvider(
      create: (context) => StudentMandatoryFieldsCubit()
        ..fetchMandatoryFieldsData(context.read<AuthCubit>().uid)
        ..checkDetailsFilled(context.read<AuthCubit>().uid),
      child:
          BlocConsumer<StudentMandatoryFieldsCubit, StudentMandatoryFieldState>(
        buildWhen: (previous, current) => current is! DataFilledActionState,
        listenWhen: (previous, current) => current is DataFilledActionState,
        listener: (context, state) {
          if (state is DataFilledActionState) {
            context.read<CheckCubit>().emitAllDataPresentState();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CustomTextButton(
                      title: 'Logout',
                      onPressed: () {
                        context.read<AuthCubit>().signOut();
                      }),
                  //       const Expanded(
                  //         child: Center(
                  //           child: AutoSizeText(
                  //             'DentPlusBytes',
                  //             style: TextStyle(fontFamily: 'Euclid', fontSize: 30),
                  //           ),
                  //         ),
                  //       ),
                ],
              ),
            ),
            body: BlocBuilder<StudentMandatoryFieldsCubit,
                StudentMandatoryFieldState>(
              builder: (context, state) {
                if (state.initialFieldsRendered &&
                    !context
                        .read<StudentMandatoryFieldsCubit>()
                        .initialDataRendered) {
                  nameController.text = state.name.value;
                  clinicPhoneController.text = state.phone.value;
                  emailController.text = state.email.value;
                  context
                      .read<StudentMandatoryFieldsCubit>()
                      .initialDataRendered = true;
                }
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   margin: const EdgeInsets.only(top: 20),
                        //   height: screenHeight * 0.08,
                        //   width: screenWidth * 0.6,
                        //   child: Image.asset("rankUP_banner.png"),
                        // ),
                        //heightBetweenFields(screenHeight),
                        // Lottie.asset("login_animation_2.json",
                        //     height: screenHeight * 0.3),
                        const AutoSizeText(
                          'Your details matter',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Euclid',
                          ),
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Name',
                                  onChanged: context
                                      .read<StudentMandatoryFieldsCubit>()
                                      .nameChanged,
                                  controller: nameController,
                                  errorText: state.name.error,
                                  enabled: !state.hasName,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Phone No',
                                  prefixText: '+91',
                                  onChanged: context
                                      .read<StudentMandatoryFieldsCubit>()
                                      .clinicPhoneChanged,
                                  controller: clinicPhoneController,
                                  errorText: state.phone.error,
                                  enabled: !state.hasPhoneNo,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Email',
                                  onChanged: context
                                      .read<StudentMandatoryFieldsCubit>()
                                      .emailChanged,
                                  controller: emailController,
                                  errorText: state.email.error,
                                  enabled: !state.hasEmail,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              // Container(
                              //   width:
                              //       MediaQuery.of(context).size.width *
                              //           0.2,
                              //   color: const Color(0xff0057ff),
                              //   child: ElevatedButton(
                              //     child: const Padding(
                              //       padding: EdgeInsets.all(5),
                              //       child: Text(
                              //         'Save',
                              //         style: TextStyle(
                              //           fontFamily: 'Euclid',
                              //           fontSize: 20,
                              //         ),
                              //       ),
                              //     ),
                              //     onPressed: () {
                              //       if (_formkey.currentState!
                              //           .validate()) {
                              //         context
                              //             .read<StudentMandatoryFieldsCubit>()
                              //             .setUpdateMandatoryFields(
                              //               context
                              //                   .read<AuthCubit>()
                              //                   .uid,
                              //             );
                              //       }
                              //     },
                              //   ),
                              // ),
                              CustomElevatedButton(
                                  title: 'Save',
                                  color: secondary_2,
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      context
                                          .read<StudentMandatoryFieldsCubit>()
                                          .setUpdateMandatoryFields(
                                            context.read<AuthCubit>().uid,
                                          );
                                    }
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
