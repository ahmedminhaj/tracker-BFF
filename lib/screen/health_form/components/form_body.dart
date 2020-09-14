import 'package:act_tracker/screen/health/health_screen.dart';
import 'package:act_tracker/screen/health_form/components/form_input_field.dart';
import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/style/style_size.dart';
import 'package:act_tracker/widgets/button/route_button.dart';
import 'package:act_tracker/widgets/text/sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormBody extends StatefulWidget {
  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormInputField(
                inputFieldLabel: "Weight(kg)",
                hintText: "78",
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter Current weight";
                  }
                  return null;
                },
              ),
              FormInputField(
                inputFieldLabel: "Body Temperature(°C)",
                hintText: "98",
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter Current body temperature";
                  }
                  return null;
                },
              ),
              FormInputField(
                inputFieldLabel: "Blood Pressure(mmHg)",
                hintText: "118/79",
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter blood pressure";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                color: StyleColor.buttonColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Get.snackbar("Data processing", "no issues");
                    Get.to(HealthScreen());
                  }
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                    color: StyleColor.buttonTextColor,
                    fontSize: StyleSize.buttonTextSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
