#!/usr/bin/env ruby

require_relative 'preferences_data'
require_relative 'similarity_helper'

def knn_recommend(preferences, get_similarity, user, num_neighbours)
  total = Hash.new { |h, k| h[k] = 0 }
  others_with_score = get_neighbours(preferences, get_similarity, user, num_neighbours)
  others_with_score.each do |_, items, score|
    items.each do |item|
      next if preferences[user].include?(item)
      total[item] += score
    end
  end
  total.sort_by { |_,score| -score }
end

def get_neighbours(user_prefs, get_similarity, user, num_neighbours)
  rankings = user_prefs.map do |other, items|
    score = user == other ? Float.MIN: get_similarity.call(user_prefs, user, other)
    [other, items, score]
  end
  rankings.sort_by { |_, _, score| -score }[0..num_neighbours-1]
end

[:user1, :user2, :user3].each do |user|
  puts knn_recommend(BOOLEAN_USER_PREFERENCES, method(:jaccard_similarity), user, 1).inspect
end
