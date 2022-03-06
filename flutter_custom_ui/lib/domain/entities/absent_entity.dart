class AbsentEntity {
  final String checkIn;
  final String checkOut;
  final String date;
  final String id;
  final String? status;

  AbsentEntity(
      {required this.checkIn,
      required this.checkOut,
      required this.date,
      required this.id,
      this.status});
}
