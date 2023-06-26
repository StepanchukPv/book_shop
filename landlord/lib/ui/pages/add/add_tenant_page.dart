part of '../add/widgets.dart';

class AddTenantPage extends StatefulWidget {
  AddTenantPage({Key? key}) : super(key: key);

  @override
  _AddTenantPageState createState() => _AddTenantPageState();
}

class _AddTenantPageState extends State<AddTenantPage> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final infoController = TextEditingController();
  final tokenController = TextEditingController();
  final dateController = TextEditingController();
  final priceController = TextEditingController();

  void aboutTokenDialog() {
    FocusScope.of(context).unfocus();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            title: Text('Token'),
            content: Container(
              child: RichText(
                text: TextSpan(
                  text: 'You can find ',
                  style: ResourceTextStyle.normal,
                  children: [
                    TextSpan(text: 'token', style: ResourceTextStyle.medium),
                    TextSpan(
                      text: ' in tenant profile if he already has account. Token will help you faster fill the form.',
                    )
                  ],
                ),
              ),
            ),
            actionsPadding: const EdgeInsets.only(right: 20),
            actions: [
              Button.outline(
                'OK',
                constraints: BoxConstraints(maxWidth: 70),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    infoController.dispose();
    tokenController.dispose();
    dateController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Add new tenant'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildImage(ResoureImage.img_tenant_2),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(labelText: 'First\nname', controller: nameController),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(labelText: 'Second\nname', controller: surnameController),
                  )
                ],
              ),
              const SizedBox(height: 25),
              _buildTextField(labelText: 'Phone', controller: phoneController),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text('Pick accomodation: ', style: ResourceTextStyle.medium),
                  const SizedBox(width: 10),
                  PlaceList.cache.isEmpty
                      ? Container(
                          width: 190,
                          child: DropdownButton(
                            underline: Container(height: 2, color: ResoureColors.primary_1),
                            borderRadius: BorderRadius.circular(10),
                            value: 'You don\'t have one yet',
                            onChanged: (value) {},
                            items: [
                              DropdownMenuItem(
                                value: 'You don\'t have one yet',
                                child: Text('You don\'t have one yet'),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 193,
                          child: DropdownButton(
                            underline: Container(height: 2, color: ResoureColors.primary_1),
                            borderRadius: BorderRadius.circular(10),
                            value: PlaceList.cache.first.title,
                            onChanged: (value) {},
                            items: PlaceList.cache.map((e) {
                              return DropdownMenuItem(
                                value: e.title,
                                child: Text(e.title),
                              );
                            }).toList(),
                          ),
                        )
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    'Or you can just use Token',
                    style: ResourceTextStyle.medium,
                  ),
                  const SizedBox(width: 2),
                  InkWell(
                    onTap: () => aboutTokenDialog(),
                    child: SvgPicture.asset(
                      ResoureImage.ic_question,
                      color: ResoureColors.primary_1,
                      height: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildTextField(labelText: 'Token', controller: tokenController),
              const SizedBox(height: 20),
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Stack(
                      children: [
                        _buildTextField(
                          labelText: 'Date of payment',
                          controller: dateController,
                          suffixIcon: Container(
                            padding: const EdgeInsets.all(7),
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: ResoureColors.primary_1,
                            ),
                          ),
                          labelBehavior: FloatingLabelBehavior.always,
                        ),
                        Positioned.fill(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                              if (Platform.isIOS) {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (_) => Container(
                                    height: 500,
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 400,
                                          child: CupertinoDatePicker(
                                            initialDateTime: DateTime.now(),
                                            onDateTimeChanged: (val) {
                                              setState(
                                                () {
                                                  dateController.text = DateFormat('dd MMMM').format(val).toString();
                                                },
                                              );
                                            },
                                          ),
                                        ),

                                        // Close the modal
                                        CupertinoButton(
                                          child: const Text('OK'),
                                          onPressed: () => Navigator.of(context).pop(),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(DateTime.now().year, 1, 1),
                                    lastDate: DateTime(DateTime.now().year, 12, 31),
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData(
                                          primaryColor: ResoureColors.primary_1,
                                          colorScheme: ColorScheme.light(primary: ResoureColors.accent_1),
                                        ),
                                        child: child ?? const SizedBox(),
                                      );
                                    }).then(
                                  (value) {
                                    if (value == null) return;
                                    dateController.text = DateFormat('dd MMMM').format(value).toString();
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      labelText: 'Pay price',
                      controller: priceController,
                      labelBehavior: FloatingLabelBehavior.always,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
