class AuthUser {
    final String? accessToken;
    final String? email;
    final String? role;
    final String? message;

    AuthUser({
        this.accessToken,
        this.email,
        this.role,
        this.message,
    });

    factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        accessToken: json["access_token"],
        email: json["email"],
        role: json["role"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "email": email,
        "role": role,
        "message": message,
    };
}
