class UpdateServiceRequest {
  final int? cost;

  UpdateServiceRequest({this.cost});

  factory UpdateServiceRequest.fromJson(Map<String, dynamic> json) {
    return UpdateServiceRequest(
      cost: json['cost'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cost': cost,
    };
  }
}
