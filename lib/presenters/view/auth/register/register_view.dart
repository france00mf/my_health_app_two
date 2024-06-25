import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

    Country selectedCountry = Country(
    phoneCode: "244",
    countryCode: "AO",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Angola",
    example: "Angola",
    displayName: "Angola",
    displayNameNoCountryCode: "AO",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}