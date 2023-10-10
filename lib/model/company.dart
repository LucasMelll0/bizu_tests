class Company {
  String id;
  String name;

  Company({required this.id, required this.name});

  factory Company.fromJson(Map<String, dynamic> json) =>
      Company(id: json['metadata']['data']['id'],
          name: json['metadata']['data']['name']);

}