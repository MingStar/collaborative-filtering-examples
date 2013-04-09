def recommend(preferences, get_similarity, user)
  # initialise
  totals = Hash.new { |h, k| h[k] = 0 }
  # for each other user
  preferences.each do |other, items|
    next if user == other # skip the user
    score = get_similarity.call(preferences, user, other)
    items.each do |item|
      # only score items that the user haven't touched
      next if preferences[user].include?(item)
      totals[item] += score
    end
  end
  totals.sort_by { |_,score| -score }
end
