class AddRateRequestBody {
  final double odometerBefore,
      kmCount,
      kmPerLiter,
      kmPerEGP,
      literCount,
      literPrice,
      fullTankPrice;

  AddRateRequestBody(
      {required this.odometerBefore,
      required this.kmCount,
      required this.kmPerLiter,
      required this.kmPerEGP,
      required this.literCount,
      required this.literPrice,
      required this.fullTankPrice});

  Map<String, dynamic> toJson() {
    return {
      'odometerBefore': odometerBefore,
      'kmCount': kmCount,
      'kmPerLiter': kmPerLiter,
      'kmPerEGP': kmPerEGP,
      'literCount': literCount,
      'literPrice': literPrice,
      'fullTankPrice': fullTankPrice
    };
  }
}