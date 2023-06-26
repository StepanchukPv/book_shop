part of '../add/widgets.dart';

class AddPlacePage extends StatefulWidget {
  const AddPlacePage({Key? key}) : super(key: key);

  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final infoController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    addressController.dispose();
    infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Add new place'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildImage(ResoureImage.img_house_2),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(labelText: 'Title', controller: titleController),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              _buildTextField(labelText: 'Address', controller: addressController),
              const SizedBox(height: 25),
              _buildTextField(labelText: 'Information', controller: infoController),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.outlineWIdget(
                    Row(
                      children: [
                        Text('Continue', style: ResourceTextStyle.medium),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    onTap: () {
                      PlaceList.addPlace(
                        Place(
                            title: titleController.text,
                            tenant: 'Alex',
                            date: DateTime.now(),
                            info: 'Additional info',
                            addres: addressController.text),
                      );
                      Navigator.of(context).pop(context);
                      // final route = MaterialPageRoute(builder: (_) => MainPage());
                      // Navigator.of(context).pushReplacement(route);
                    },
                    constraints: BoxConstraints(maxWidth: 120),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
