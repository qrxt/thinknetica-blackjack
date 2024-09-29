# frozen_string_literal: true

require 'test/unit'

require_relative './hand'
require_relative '../card/card'

class TestTrain < Test::Unit::TestCase
  def test_aces_value_two_aces
    hand = Hand.new([Card.new('♥', 'A'), Card.new('♦', 'A')])

    assert_equal(12, hand.value)
  end

  def test_aces_value_ace_with_non_aces
    hand = Hand.new([Card.new('♥', 'A'), Card.new('♦', 'K', 10), Card.new('♦', '10', 10)])

    assert_equal(21, hand.value)
  end

  def test_aces_value_ace_with_non_ace
    hand = Hand.new([Card.new('♥', 'A'), Card.new('♦', '2', 2)])

    assert_equal(13, hand.value)
  end

  def test_aces_value_three_aces
    hand = Hand.new([Card.new('♥', 'A'), Card.new('♥', 'A'), Card.new('♥', 'A')])

    assert_equal(13, hand.value)
  end

  def test_aces_value21
    hand = Hand.new([Card.new('♥', '2', 2), Card.new('♥', '8', 8), Card.new('♥', 'A')])

    assert_equal(21, hand.value)
  end
end
