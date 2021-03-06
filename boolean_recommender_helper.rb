def recommend(preferences, get_similarity, user)
  # initialise
  totals = Hash.new { |h, k| h[k] = 0 }
  # calculate scores
  preferences.each do |other, items|
    next if user == other # skip the user
    score = get_similarity.call(preferences, user, other)
    # only score items that the user has no preferences
    (items - preferences[user]).each do |item|
      totals[item] += score
    end
  end
  totals.sort_by { |_,score| -score }
end
