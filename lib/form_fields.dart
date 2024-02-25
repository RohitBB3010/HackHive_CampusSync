import 'package:formz/formz.dart';

class RequiredTextInput extends FormzInput<String, String> {
  const RequiredTextInput.pure() : super.pure('');
  const RequiredTextInput.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return value.isNotEmpty == true ? null : 'This field is required';
  }
}

class TextListInput extends FormzInput<List<String>, String> {
  const TextListInput.pure() : super.pure(const []);
  const TextListInput.dirty([super.value = const []]) : super.dirty();

  @override
  String? validator(List<String> value) {
    return value.isNotEmpty == true ? null : 'This field is required';
  }
}

class randomField extends FormzInput<String, String> {
  const randomField.pure() : super.pure('');
  const randomField.dirt([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return null;
  }
}

//creating Field class to get data from single text field
class Field extends FormzInput<String, String> {
  const Field.pure() : super.pure('');
  const Field.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (double.tryParse(value) != null) {
      return value.length < 10 == true
          ? 'Please enter a valid phone number'
          : null;
    } else {
      return value.contains('@') != true
          ? 'Please enter a valid email address'
          : null;
    }
  }
}

class userTypeFormz extends FormzInput<String, String> {
  const userTypeFormz.pure() : super.pure('');
  const userTypeFormz.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return null;
  }
}

class TextInput extends FormzInput<String, String> {
  const TextInput.pure() : super.pure('');
  const TextInput.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return null;
  }
}

class Phone extends FormzInput<String, String> {
  const Phone.pure() : super.pure(''); //Storing empty initial value of phone
  const Phone.dirty([super.value = ''])
      : super.dirty(); //Strong th chsanging values of phone

  //validator that gives errors based on our condition
  @override
  String? validator(String value) {
    return (double.tryParse(value) == null) || value.length != 10
        ? 'Please enter a valid number'
        : null;
  }
}

class OTP extends FormzInput<String, String> {
  const OTP.pure() : super.pure('');
  const OTP.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String? value) {
    return (value?.isEmpty == true) || value?.length != 6
        ? 'OTP should be 6 characters long'
        : null;
  }
}

class Email extends FormzInput<String, String> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String? value) {
    return value?.isEmpty == true || !value!.contains('@')
        ? 'Please enter a valid mail'
        : null;
  }
}

class Role extends FormzInput<String, String> {
  const Role.pure() : super.pure('');
  const Role.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return null;
  }
}

class Password extends FormzInput<String, String> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );

  @override
  String? validator(String? value) {
    if (value!.length < 6) {
      return 'Password must be of atleast 6 characters';
    }
    if (value.isEmpty) {
      return "Passwords can't be empty";
    }
    return null;
  }
}
