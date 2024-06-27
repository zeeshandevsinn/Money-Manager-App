class Country {
  String name;
  String picture;

  Country({required this.name, required this.picture});
}

List<Country> countryList = [
  Country(name: 'America', picture: 'assets/images/flug.png'),
  Country(name: 'Canada', picture: 'assets/images/logo.png'),
  Country(name: 'UK', picture: 'assets/images/flug.png'),
  Country(name: 'USA', picture: 'assets/images/logo.png'),
];
