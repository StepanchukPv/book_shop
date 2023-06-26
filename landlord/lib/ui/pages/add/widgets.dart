import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:landlord/models/place.dart';
import 'package:landlord/models/test.dart';
import 'package:landlord/ui/common/button.dart';
import 'package:landlord/ui/resource/colors.dart';
import 'package:landlord/ui/resource/images.dart';
import 'package:landlord/ui/resource/styles.dart';

part '../add/add_tenant_page.dart';
part '../add/add_place_page.dart';

AppBar _buildAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: ResourceTextStyle.title,
    ),
    bottom: PreferredSize(
      child: Container(
        color: ResoureColors.accent_1,
        height: 3.0,
      ),
      preferredSize: Size.fromHeight(0.0),
    ),
    automaticallyImplyLeading: false,
    leading: InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 10,
        width: 10,
        child: SvgPicture.asset(
          ResoureImage.ic_back,
          color: ResoureColors.accent_1,
        ),
      ),
    ),
  );
}

TextField _buildTextField({
  required String labelText,
  required TextEditingController controller,
  Widget? suffixIcon,
  FloatingLabelBehavior labelBehavior = FloatingLabelBehavior.auto,
  TextInputType textInputType = TextInputType.text,
}) {
  return TextField(
    controller: controller,
    style: ResourceTextStyle.medium,
    cursorColor: ResoureColors.primary_1,
    keyboardType: textInputType,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ResoureColors.primary_1, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ResoureColors.primary_1, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      floatingLabelBehavior: labelBehavior,
      label: Text(labelText),
      labelStyle: ResourceTextStyle.normal,
      suffixIcon: suffixIcon,
    ),
  );
}

Container _buildImage(String imageAsset) {
  return Container(
    width: 130,
    height: 130,
    decoration: BoxDecoration(
      border: Border.all(width: 3, color: ResoureColors.accent_1),
      borderRadius: BorderRadius.circular(120),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(1200),
      child: Image.asset(
        imageAsset,
        fit: BoxFit.fill,
      ),
    ),
  );
}
