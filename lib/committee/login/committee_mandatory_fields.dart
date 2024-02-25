import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/committee/login/cubits/check_committee_cubit.dart';
import 'package:campus_sync/committee/login/cubits/committee_mandatory_fields_cubit.dart';
import 'package:campus_sync/committee/login/forms/committee_mandatory_field_state.dart';
import 'package:campus_sync/components/custom_text_field.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/components/text_button.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommitteeMandatoryFields extends StatelessWidget {
  CommitteeMandatoryFields({super.key});

  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final committeeController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommitteeMandatoryFieldsCubit()
        ..fetchMandatoryFieldsData(context.read<AuthCubit>().uid)
        ..checkDetailsFilled(context.read<AuthCubit>().uid),
      child: BlocConsumer<CommitteeMandatoryFieldsCubit,
          CommitteeMandatoryFieldState>(
        buildWhen: (previous, current) =>
            current is! CommitteeDataFilledActionState,
        listenWhen: (previous, current) =>
            current is CommitteeDataFilledActionState,
        listener: (context, state) {
          if (state is CommitteeDataFilledActionState) {
            context.read<CheckCommitteeCubit>().emitAllDataPresentState();
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
            body: BlocBuilder<CommitteeMandatoryFieldsCubit,
                CommitteeMandatoryFieldState>(
              builder: (context, state) {
                if (state.initialFieldsRendered &&
                    !context
                        .read<CommitteeMandatoryFieldsCubit>()
                        .initialDataRendered) {
                  nameController.text = state.name.value;

                  emailController.text = state.email.value;
                  context
                      .read<CommitteeMandatoryFieldsCubit>()
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Name',
                                  onChanged: context
                                      .read<CommitteeMandatoryFieldsCubit>()
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
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Email',
                                  onChanged: context
                                      .read<CommitteeMandatoryFieldsCubit>()
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomTextField(
                                  labelText: 'Convener',
                                  onChanged: context
                                      .read<CommitteeMandatoryFieldsCubit>()
                                      .conveverChanged,
                                  controller: committeeController,
                                  errorText: committeeController.text.isEmpty
                                      ? 'Field cannot be empty'
                                      : null,
                                  enabled: !state.hasConvener,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              CustomElevatedButton(
                                  title: 'Save',
                                  color: secondary_2,
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      context
                                          .read<CommitteeMandatoryFieldsCubit>()
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
