#jaccard similarity
def get_similarity(prefs, subject, other)
  intersection_count =
      (prefs[subject] & prefs[other]).length
  union_count =
      prefs[subject].length +
          prefs[other].length -
          intersection_count
  intersection_count / union_count.to_f
end