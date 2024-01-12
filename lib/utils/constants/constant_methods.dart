double averageRating(List<int> rating) {
  var avgRating = 0;
  for (int i = 0; i < rating.length; i++) {
    avgRating = avgRating + rating[i];
  }
  return double.parse((avgRating / rating.length).toStringAsFixed(1));
}
