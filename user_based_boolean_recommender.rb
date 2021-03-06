#!/usr/bin/env ruby

require_relative 'preferences_data'
require_relative 'similarity_helper'
require_relative 'boolean_recommender_helper'

[:user1, :user2, :user3].each do |user|
  puts recommend(
           BOOLEAN_USER_PREFERENCES,
           method(:jaccard_similarity),
           user).inspect
end