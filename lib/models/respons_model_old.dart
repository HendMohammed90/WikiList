class Response {
  final String token;
  final String error;

  Response({required this.token, required this.error});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}
