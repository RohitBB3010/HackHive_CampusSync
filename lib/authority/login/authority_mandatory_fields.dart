import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/authority/login/cubits/authority_mandatory_fields_cubit.dart';
import 'package:campus_sync/authority/login/cubits/check_authority_cubit.dart';
import 'package:campus_sync/authority/login/forms/authority_mandatory_field_state.dart';
import 'package:campus_sync/components/customDropDown.dart';
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
  final roleCOntroller = TextEditingController();
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
            context.read<CheckAuthorityCubit>().emitAllDataPresentState();
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
                                  labelText: 'Convener',
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
                                  controller: roleCOntroller,
                                  errorText: null,
                                  enabled: true,
                                ),
                              ),
                              heightBetweenFields_2(context),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: CustomDropDown(
                                  onChanged: context
                                      .read<AuthorityMandatoryFieldsCubit>()
                                      .committeeChanged,
                                  items: committees.map((committee) {
                                    return DropdownMenuItem<String>(
                                        value: committee,
                                        child: AutoSizeText(committee));
                                  }).toList(),
                                  dropdownHeight:
                                      MediaQuery.of(context).size.height * 0.05,
                                  dropdownWidth:
                                      MediaQuery.of(context).size.width * 0.05,
                                  hint: const AutoSizeText('Select Committee'),
                                ),
                              ),
                              heightBetweenFields_1(context),
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
