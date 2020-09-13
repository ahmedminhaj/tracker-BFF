import 'package:act_tracker/widgets/info_feild.dart/health_info_feild.dart';
import 'package:flutter/material.dart';

class HealthInfoDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        HealthInfoFeild(
          infoFeildTitle: "Weight",
          infoFeildValue: "78 kg",
        ),
        HealthInfoFeild(
          infoFeildTitle: "Height",
          infoFeildValue: "168 cm",
        ),
        HealthInfoFeild(
          infoFeildTitle: "Body Temperature",
          infoFeildValue: "98°C",
        ),
        HealthInfoFeild(
          infoFeildTitle: "Blood Pressure",
          infoFeildValue: "118/79",
        ),
      ],
    );
  }
}
