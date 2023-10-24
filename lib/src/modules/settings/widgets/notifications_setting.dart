import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class NotificationsSetting extends StatefulWidget {
  const NotificationsSetting({Key? key}) : super(key: key);

  @override
  State<NotificationsSetting> createState() => _NotificationsSettingState();
}

class _NotificationsSettingState extends State<NotificationsSetting> {
  bool _isSale = true;
  bool _isArrival = false;
  bool _isDelivery = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Notifications",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MyColors.colorBlack),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        _itemSwitch(
            title: 'Sales',
            isSwitched: _isSale,
            onChanged: (value) {
              setState(() {
                _isSale = value;
              });
            }),
        _itemSwitch(
            title: 'New arrivals',
            isSwitched: _isArrival,
            onChanged: (value) {
              setState(() {
                _isArrival = value;
              });
            }),
        _itemSwitch(
            title: 'Delivery status changes',
            isSwitched: _isDelivery,
            onChanged: (value) {
              setState(() {
                _isDelivery = value;
              });
            }),
      ],
    );
  }

  Widget _itemSwitch(
      {required String title,
      required bool isSwitched,
      required Function(bool) onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              height: 1.42,
              color: MyColors.colorBlack,
              fontWeight: FontWeight.w500),
        ),
        Switch(
          onChanged: onChanged,
          value: isSwitched,
          activeColor: MyColors.colorGreen,
          activeTrackColor: MyColors.colorGray.withOpacity(0.2),
          inactiveThumbColor: MyColors.colorWhite,
          inactiveTrackColor: MyColors.colorGray.withOpacity(0.2),
        )
      ],
    );
  }
}
