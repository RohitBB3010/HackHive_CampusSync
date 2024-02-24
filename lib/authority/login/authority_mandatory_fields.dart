import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/authority/login/cubits/authority_mandatory_fields_cubit.dart';
import 'package:campus_sync/authority/login/cubits/check_cubit.dart';
import 'package:campus_sync/authority/login/forms/authority_mandatory_field_state.dart';
import 'package:campus_sync/components/custom_text_field.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/components/text_button.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:campus_sync/consts/empty_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AuthorityMandatoryFields extends StatelessWidget {
  AuthorityMandatoryFields({super.key});

  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final clinicPhoneController = TextEditingController();
  final emailController = TextEditingController();
  String? selectedValue;
  final List<String> committees = [
    'CSI',
    'CESA',
    'ITSA',
    'IEEE',
    'GDSC',
    'SC',
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return BlocProvider(
      create: (context) => AuthorityMandatoryFieldsCubit()
        ..fetchMandatoryFieldsData(context.read<AuthCubit>().uid)
        ..checkDetailsFilled(context.read<AuthCubit>().uid),
      child: BlocConsumer<AuthorityMandatoryFieldsCubit,
          AuthorityMandatoryFieldState>(
        buildWhen: (previous, current) =>
            current is! AuthorityDataFilledActionState,
        listenWhen: (previous, current) =>
            current is AuthorityDataFilledActionState,
        listener: (context, state) {
          if (state is AuthorityDataFilledActionState) {
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
                ],
              ),
            ),
            body: BlocBuilder<AuthorityMandatoryFieldsCubit,
                AuthorityMandatoryFieldState>(
              builder: (context, state) {
                if (state.initialFieldsRendered &&
                    !context
                        .read<AuthorityMandatoryFieldsCubit>()
                        .initialDataRendered) {
                  nameController.text = state.name.value;
                  clinicPhoneController.text = state.phone.value;
                  emailController.text = state.email.value;
                  context
                      .read<AuthorityMandatoryFieldsCubit>()
                      .initialDataRendered = true;
                }
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                              heightBetweenFields_2(context),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Name',
                                  onChanged: context
                                      .read<AuthorityMandatoryFieldsCubit>()
                                      .nameChanged,
                                  controller: nameController,
                                  errorText: state.name.error,
                                  enabled: !state.hasName,
                                ),
                              ),
                              heightBetweenFields_2(context),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Phone No',
                                  prefixText: '+91',
                                  onChanged: context
                                      .read<AuthorityMandatoryFieldsCubit>()
                                      .phoneChanged,
                                  controller: clinicPhoneController,
                                  errorText: state.phone.error,
                                  enabled: !state.hasPhoneNo,
                                ),
                              ),
                              heightBetweenFields_2(context),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Email',
                                  onChanged: context
                                      .read<AuthorityMandatoryFieldsCubit>()
                                      .emailChanged,
                                  controller: emailController,
                                  errorText: state.email.error,
                                  enabled: !state.hasEmail,
                                ),
                              ),
                              heightBetweenFields_2(context),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Role',
                                  onChanged: context
                                      .read<AuthorityMandatoryFieldsCubit>()
                                      .roleChanged,
                                  controller: emailController,
                                  errorText: state.email.error,
                                  enabled: !state.hasEmail,
                                ),
                              ),
                              heightBetweenFields_2(context),
                              CustomElevatedButton(
                                  title: 'Save',
                                  color: secondary_2,
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      context
                                          .read<AuthorityMandatoryFieldsCubit>()
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