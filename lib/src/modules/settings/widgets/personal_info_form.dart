import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/settings/logic/setting_bloc.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Information",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MyColors.colorBlack),
          ),
          SizedBox(
            height: size.height * 0.026,
          ),
          XTextField(
            label: "Full name",
            value: state.name,
            textInputType: TextInputType.name,
            errorText: state.isValidName,
            onChanged: (value) =>
                context.read<SettingBloc>().changedName(value),
          ),
          XTextField(
              label: "Date of Birth",
              value: state.birthDay,
              readOnly: true,
              textInputType: TextInputType.datetime,
              errorText: state.isValidBirthDay,
              isAction: false,
              onTap: () => _selectDate(context),
              onChanged: (value) {}),
        ],
      );
    });
  }

  void _selectDate(BuildContext context) async {
    var formatter = DateFormat('dd/MM/yyyy');
    DateTime selectedDate = DateTime.now();

    String date = "";
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1800),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      date = formatter.format(selectedDate);

      context.read<SettingBloc>().changedBirthDay(date);
    }
  }
}
