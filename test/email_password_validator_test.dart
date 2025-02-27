import 'package:application/ClientApp/authentication/ClientLoginScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main()
{

  test('empty email return error string' , (){

    var result = EmailFieldValidator.validate('');
    expect(result, 'please enter your email');
  });

  test('non-empty email returns null', (){
    var result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

  test('empty password return error string' , (){

    var result = PasswordFieldValidator.validate('');
    expect(result, 'please enter your password');
  });

  test('non-empty password returns null', (){
    var result = PasswordFieldValidator.validate('password');
    expect(result, null);
  });
}
