class DHT{
  final String hari;
  final String jam;
  final String tanggal;
  final double ph;
  final double salinitasAir;
  final double ketinggianAir;
  final String keadaan;

  DHT({
      this.hari, this.jam, this.tanggal, 
      this.ph, this.salinitasAir, this.ketinggianAir,
      this.keadaan
    });

  factory DHT.fromJson(Map<dynamic, dynamic>json){
    double parser(dynamic source){
      try{
        return double.parse(source.toString());
      }
      on FormatException{
        return -1;
      }
    }
    return DHT(
      hari: (json['hari']),
      jam: (json['jam']),
      tanggal: (json['tanggal']),
      ph: parser(json['ph']),
      salinitasAir: parser(json['salinitas_air']),
      ketinggianAir: parser(json['ketinggian_air']),
      keadaan: (json['keadaan']),
    );
  }
}