import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/Screen/profile_screen/profile_header.dart';
import 'package:online_shop/models/home_app.dart';

import '../../configs/size_config.dart';
import '../../constants/color_constant.dart';
import '../../constants/icon_constant.dart';
import '../../utils/translate.dart';
import '../../widgets/custom_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("settings"),
                icon: ICON_CONST.SETTING,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
              ),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("cart"),
                icon: ICON_CONST.CART,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
              ),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("my_orders"),
                icon: ICON_CONST.ORDER,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
              ),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("delivery_address"),
                icon: ICON_CONST.ADDRESS,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
              ),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("log_out"),
                icon: ICON_CONST.LOG_OUT,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildProfileMenuButton({
    required String text,
    required String icon,
    required Function() onPressed,
  }) {
    return CustomListTile(
      leading: SvgPicture.asset(
        icon,
        color: COLOR_CONST.primaryColor,
        width: SizeConfig.defaultSize * 3,
      ),
      title: text,
      onPressed: onPressed,
      trailing: Icon(Icons.arrow_forward_ios, color: COLOR_CONST.textColor),
    );
  }
}