import 'package:flutter/material.dart';
import 'package:landlord/ui/pages/add/widgets.dart';
import 'package:landlord/ui/resource/colors.dart';
import 'package:landlord/ui/resource/images.dart';
import 'package:landlord/ui/resource/styles.dart';

enum _AddPageType {
  tenant,
  place,
}

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  Widget buildCard({
    required String imageAsset,
    required String text,
    required _AddPageType addPageType,
    required double width,
    required BuildContext context,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: InkWell(
        onTap: () {
          final route = MaterialPageRoute(
            builder: (context) => addPageType == _AddPageType.tenant ? AddTenantPage() : AddPlacePage(),
          );
          Navigator.of(context, rootNavigator: true).push(route);
        },
        child: Container(
          width: width * 0.45,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: ResoureColors.accent_1, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Image.asset(
                imageAsset,
              ),
              const SizedBox(height: 20),
              Text(
                text,
                style: ResourceTextStyle.mediumOverline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: topPadding + 5, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard(
                  imageAsset: ResoureImage.img_house_1,
                  text: 'New place',
                  addPageType: _AddPageType.place,
                  width: width,
                  context: context,
                ),
                buildCard(
                  imageAsset: ResoureImage.img_tenant_1,
                  addPageType: _AddPageType.tenant,
                  text: 'New tenant',
                  width: width,
                  context: context,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
