#!/usr/bin/env ruby

require_relative 'preferences_data'
require_relative 'similarity_helper'

def recommend(preferences, get_similarity, user)
  # initialise
  totals = Hash.new { |h, k| h[k] = 0 }
  sum_weights = Hash.new { |h, k| h[k] = 0 }
  # for each other user
  preferences.each do |other, items|
    next if user == other # skip the user
    score = get_similarity.call(preferences, user, other)
    items.each do |item, rating|
      # only score items that the user haven't touched
      next if preferences[user].has_key?(item)
      totals[item] += rating * score
      sum_weights[item] += score
    end
  end
  totals = sum_weights.map do |item, weights|
    [ item, weights == 0 ? 0 : totals[item]/weights ]
  end
  totals.sort_by { |_,score| -score }
end

[:user1, :user2, :user3].each do |user|
  puts recommend(USER_PREFERENCES, method(:pearson_similarity), user).inspect
end