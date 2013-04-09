#!/usr/bin/env ruby

require_relative 'preferences_data'
require_relative 'similarity_helper'
require_relative 'boolean_recommender_helper'

(1..5).each do |index|
  item = "item#{index}".to_sym
  puts recommend(
           BOOLEAN_ITEM_PREFERENCES,
           method(:jaccard_similarity),
           item).inspect
end