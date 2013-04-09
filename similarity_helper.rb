require 'set'

module Enumerable
  def sum(identity = 0, &block)
    if block_given?
      map(&block).sum(identity)
    else
      inject(:+) || identity
    end
  end
end

def jaccard_similarity(prefs, subject, other)
  intersection_count =
      (prefs[subject] & prefs[other]).length
  union_count =
      prefs[subject].length +
          prefs[other].length -
          intersection_count
  intersection_count / union_count.to_f
end

def pearson_similarity(prefs, subject, other)
  subject_prefs = prefs[subject]
  other_prefs = prefs[other]
  si = Set.new
  subject_prefs.each do |item, _|
    si << item if other_prefs.has_key?(item)
  end
  n = si.length
  return 0 if n == 0
  n = n.to_f

  sum1 = si.sum { |item| subject_prefs[item] }
  sum2 = si.sum { |item| other_prefs[item] }

  sum_of_square_1 = si.sum { |item| square(subject_prefs[item]) }
  sum_of_square_2 = si.sum { |item| square(other_prefs[item]) }

  sum_of_products = si.sum { |item| subject_prefs[item] * other_prefs[item] }

  num = sum_of_products - sum1 * sum2 / n
  den = Math.sqrt( (sum_of_square_1 - square(sum1) / n) * (sum_of_square_2 - square(sum2) / n) )
  return 0 if den == 0

  num / den
end

def square(x)
  x * x
end