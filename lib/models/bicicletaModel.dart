// To parse this JSON data, do
//
//     final bicicletaModel = bicicletaModelFromJson(jsonString);

import 'dart:convert';

List<BicicletaModel> bicicletaModelFromJson(String str) => List<BicicletaModel>.from(json.decode(str).map((x) => BicicletaModel.fromJson(x)));

String bicicletaModelToJson(List<BicicletaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BicicletaModel {
    BicicletaModel({
        this.idmibicicleta,
        this.disponible,
        this.marca,
        this.color,
        this.timestamp,
        this.precioalquiler,
        this.valortiempohoras,
        this.valortiempomin,
        this.descripcionbici,
        this.foto,
        this.estado,
        this.user,
        this.material,
        this.categoria,
    });

    int idmibicicleta;
    bool disponible;
    String marca;
    String color;
    DateTime timestamp;
    String precioalquiler;
    int valortiempohoras;
    int valortiempomin;
    String descripcionbici;
    String foto;
    bool estado;
    User user;
    Material material;
    Categoria categoria;

    factory BicicletaModel.fromJson(Map<String, dynamic> json) => BicicletaModel(
        idmibicicleta: json["idmibicicleta"],
        disponible: json["disponible"],
        marca: json["marca"],
        color: json["color"],
        timestamp: DateTime.parse(json["timestamp"]),
        precioalquiler: json["precioalquiler"],
        valortiempohoras: json["valortiempohoras"],
        valortiempomin: json["valortiempomin"],
        descripcionbici: json["descripcionbici"],
        foto: json["foto"],
        estado: json["estado"],
        user: User.fromJson(json["user"]),
        material: Material.fromJson(json["material"]),
        categoria: Categoria.fromJson(json["categoria"]),
    );

    Map<String, dynamic> toJson() => {
        "idmibicicleta": idmibicicleta,
        "disponible": disponible,
        "marca": marca,
        "color": color,
        "timestamp": timestamp.toIso8601String(),
        "precioalquiler": precioalquiler,
        "valortiempohoras": valortiempohoras,
        "valortiempomin": valortiempomin,
        "descripcionbici": descripcionbici,
        "foto": foto,
        "estado": estado,
        "user": user.toJson(),
        "material": material.toJson(),
        "categoria": categoria.toJson(),
    };
}

class Categoria {
    Categoria({
        this.idmodelo,
        this.nombre,
    });

    int idmodelo;
    String nombre;

    factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        idmodelo: json["idmodelo"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "idmodelo": idmodelo,
        "nombre": nombre,
    };
}

class Material {
    Material({
        this.idmaterialbicicletas,
        this.nombre,
    });

    int idmaterialbicicletas;
    String nombre;

    factory Material.fromJson(Map<String, dynamic> json) => Material(
        idmaterialbicicletas: json["idmaterialbicicletas"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "idmaterialbicicletas": idmaterialbicicletas,
        "nombre": nombre,
    };
}

class User {
    User({
        this.id,
        this.password,
        this.lastLogin,
        this.isSuperuser,
        this.username,
        this.firstName,
        this.lastName,
        this.isStaff,
        this.isActive,
        this.dateJoined,
        this.email,
        this.numcelular,
        this.groups,
        this.userPermissions,
    });

    int id;
    String password;
    DateTime lastLogin;
    bool isSuperuser;
    String username;
    String firstName;
    String lastName;
    bool isStaff;
    bool isActive;
    DateTime dateJoined;
    String email;
    String numcelular;
    List<dynamic> groups;
    List<dynamic> userPermissions;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        email: json["email"],
        numcelular: json["numcelular"] == null ? null : json["numcelular"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions: List<dynamic>.from(json["user_permissions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "email": email,
        "numcelular": numcelular == null ? null : numcelular,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
    };
}
