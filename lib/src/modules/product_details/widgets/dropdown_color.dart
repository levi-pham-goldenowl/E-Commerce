import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class XDropdownColor extends StatelessWidget {
  const XDropdownColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;

    return Container(
      width: 138,
      height: 40,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: MyColors.colorGray,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down,
                color: MyColors.colorBlack),
            iconSize: 20,
            hint: const Text(
              "Color",
              style: TextStyle(
                  color: MyColors.colorBlack,
                  height: 1.42,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            elevation: 1,
            isExpanded: true,
            borderRadius: BorderRadius.circular(8),
            style: const TextStyle(color: MyColors.colorPrimary),
            underline: const SizedBox.shrink(),
            onChanged: (String? newValue) {},
            items: <String>['Black', 'Red', 'Yellow', 'Blue']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(value),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.grey,
                    )))),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
