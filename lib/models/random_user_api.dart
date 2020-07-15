/// Contains a list of users from randomuser.me service.
///
/// [results] is a list of users
/// [info] has additional info, which might be useful for pagination

class RandomUserApi {
  final List<User> users;
  final Info info;

  RandomUserApi({this.users, this.info});

  factory RandomUserApi.fromJson(Map<String, dynamic> json) {
    return RandomUserApi(
      users: json['results'] == null
          ? null
          : (json['results'] as List)
              ?.map((result) =>
                  User.fromJson(result is Map<String, dynamic> ? result : null))
              ?.toList(),
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'results': users?.map((user) => user.toJson())?.toList(),
        'info': info,
      };

  @override
  String toString() {
    return '{results: $users, info: $info}';
  }
}

class User {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Login login;
  final Dob dob;
  final Registered registered;
  final String phone;
  final String cell;
  final Id id;
  final Picture picture;
  final String nat;

  User(
      {this.gender,
      this.name,
      this.location,
      this.email,
      this.login,
      this.dob,
      this.registered,
      this.phone,
      this.cell,
      this.id,
      this.picture,
      this.nat});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'] as String,
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      email: json['email'] as String,
      login: json['login'] == null
          ? null
          : Login.fromJson(json['login'] as Map<String, dynamic>),
      dob: json['dob'] == null
          ? null
          : Dob.fromJson(json['dob'] as Map<String, dynamic>),
      registered: json['registered'] == null
          ? null
          : Registered.fromJson(json['registered'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      cell: json['cell'] as String,
      id: json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
      picture: json['picture'] == null
          ? null
          : Picture.fromJson(json['picture'] as Map<String, dynamic>),
      nat: json['nat'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gender': gender,
        'name': name?.toJson(),
        'location': location?.toJson(),
        'email': email,
        'login': login?.toJson(),
        'dob': dob?.toJson(),
        'registered': registered?.toJson(),
        'phone': phone,
        'cell': cell,
        'id': id?.toJson(),
        'picture': picture?.toJson(),
        'nat': nat,
      };

  @override
  String toString() {
    return '{gender: $gender, name: $name, location: $location, email: $email, login: $login, dob: $dob, registered: $registered, phone: $phone, cell: $cell, id: $id, picture: $picture, nat: $nat}';
  }

  String getFullName() {
    return '${name.first} ${name.last}';
  }

  String getAvatarUrl() {
    return picture.large;
  }

  String getLocationStreet() {
    return '${location.street.number} ${location.street.name}, ${location.city}';
  }

  String getLocationState() {
    return '${location.state}, ${location.country}';
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({this.title, this.first, this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'] as String,
      first: json['first'] as String,
      last: json['last'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'first': first,
        'last': last,
      };

  @override
  String toString() {
    return '{title: $title, first: $first, last: $last}';
  }
}

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final int postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  Location(
      {this.street,
      this.city,
      this.state,
      this.country,
      this.postcode,
      this.coordinates,
      this.timezone});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: json['street'] == null
          ? null
          : Street.fromJson(json['street'] as Map<String, dynamic>),
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postcode: json['postcode'] as int,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      timezone: json['timezone'] == null
          ? null
          : Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'street': street?.toJson(),
        'city': city,
        'state': state,
        'country': country,
        'postcode': postcode,
        'coordinates': coordinates?.toJson(),
        'timezone': timezone?.toJson(),
      };

  @override
  String toString() {
    return '{street: $street, city: $city, state: $state, country: $country, postcode: $postcode, coordinates: $coordinates, timezone: $timezone}';
  }
}

class Street {
  final int number;
  final String name;

  Street({this.number, this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'number': number,
        'name': name,
      };

  @override
  String toString() {
    return '{number: $number, name: $name}';
  }
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  String toString() {
    return '{latitude: $latitude, longitude: $longitude}';
  }
}

class Timezone {
  final String offset;
  final String description;

  Timezone({this.offset, this.description});

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json['offset'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'offset': offset,
        'description': description,
      };

  @override
  String toString() {
    return '{offset: $offset, description: $description}';
  }
}

class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login(
      {this.uuid,
      this.username,
      this.password,
      this.salt,
      this.md5,
      this.sha1,
      this.sha256});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      uuid: json['uuid'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      salt: json['salt'] as String,
      md5: json['md5'] as String,
      sha1: json['sha1'] as String,
      sha256: json['sha256'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid': uuid,
        'username': username,
        'password': password,
        'salt': salt,
        'md5': md5,
        'sha1': sha1,
        'sha256': sha256,
      };

  @override
  String toString() {
    return '{uuid: $uuid, username: $username, password: $password, salt: $salt, md5: $md5, sha1: $sha1, sha256: $sha256}';
  }
}

class Dob {
  final DateTime date;
  final int age;

  Dob({this.date, this.age});

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      date: DateTime.parse(json['date'] as String),
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'age': age,
      };

  @override
  String toString() {
    return '{date: $date, age: $age}';
  }
}

class Registered {
  final DateTime date;
  final int age;

  Registered({this.date, this.age});

  factory Registered.fromJson(Map<String, dynamic> json) {
    return Registered(
      date: DateTime.parse(json['date'] as String),
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'age': age,
      };

  @override
  String toString() {
    return '{date: $date, age: $age}';
  }
}

class Id {
  final String name;
  final String value;

  Id({this.name, this.value});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      name: json['name'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'value': value,
      };

  @override
  String toString() {
    return '{name: $name, value: $value}';
  }
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'] as String,
      medium: json['medium'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'large': large,
        'medium': medium,
        'thumbnail': thumbnail,
      };

  @override
  String toString() {
    return '{large: $large, medium: $medium, thumbnail: $thumbnail}';
  }
}

class Info {
  final String seed;
  final int results;
  final int page;
  final String version;

  Info({this.seed, this.results, this.page, this.version});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      seed: json['seed'] as String,
      results: json['results'] as int,
      page: json['page'] as int,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'seed': seed,
        'results': results,
        'page': page,
        'version': version,
      };

  @override
  String toString() {
    return '{seed: $seed, results: $results, page: $page, version: $version}';
  }
}
