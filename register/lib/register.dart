import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  String? confirmPassword;
  String? selectedImagePath; // To store the path of the selected image

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/register.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter first name'),
                      MinLengthValidator(3, errorText: 'Minimum 3 characters required'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter First Name',
                      labelText: 'First Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter last name'),
                      MinLengthValidator(3, errorText: 'Last name should be at least 3 characters'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter Last Name',
                      labelText: 'Last Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your username'),
                      MinLengthValidator(5, errorText: 'Minimum 5 characters required for username'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Username',
                      labelText: 'Username',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter email address'),
                      EmailValidator(errorText: 'Please enter a valid email address'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter a password'),
                      MinLengthValidator(8, errorText: 'Minimum 8 characters required for the password'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Confirm your password'),
                      MinLengthValidator(8, errorText: 'Minimum 8 characters required for the password'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                        child: Icon(
                          _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                    obscureText: _obscureConfirmPassword,
                    onChanged: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    },
                  ),
                ),
                Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {
      // Add code for selecting/uploading a photo
    },
    child: Text('Select/Upload Photo'),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.blueAccent; // The background color when pressed
        }
        return Colors.blue; // The default background color
      }),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.all(15), // Adjust padding as needed
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
        ),
      ),
    ),
  ),
),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            print('Form submitted');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blueAccent; // The background color when pressed
                            }
                            return Colors.blue; // The default background color
                          }),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
