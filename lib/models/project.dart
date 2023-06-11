class project{
  final String title;
  final String logo;
  final String type;
  final int Etat_Pojet;
  late int taux_Payement;
  final String number_projet;


  project({
    required this.title,
    required this.logo,
    required this.type,
    required this.Etat_Pojet,
    required this.taux_Payement,
    required this.number_projet,

  }) {
    // Initialize other properties with default values
    taux_Payement = 10;

  }

}