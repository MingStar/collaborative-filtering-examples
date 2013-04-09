#!/usr/bin/env ruby

require_relative 'preferences_data'
require_relative 'similarity_helper'

def recommend_items(preferences, user)
  # initialise
  totals = Hash.new { |h, k| h[k] = 0 }
  # for each other user
  preferences.each do |other, items|
    next if user == other # skip the user
    score = get_similarity(preferences, user, other)
    items.each do |item|
      # only score items that the user haven't touched
      next if preferences[user].include?(item)
      totals[item] += score
    end
  end
  totals.sort_by { |_,score| -score }
end

[:user1, :user2, :user3].each do |user|
  puts recommend_items(BOOLEAN_USER_PREFERENCES, user).inspect
end


