class CvEntry {
  final String period;
  final String institution;
  final String? title;
  final List<String> description;
  final String? location;

  const CvEntry({
    required this.period,
    required this.institution,
    this.title,
    this.description = const [],
    this.location,
  });
}
