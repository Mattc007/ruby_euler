# The file, poker.txt, contains one-thousand random hands dealt to two players. 
# Each line of the file contains ten cards (separated by a single space): the first five are 
# Player 1's cards and the last five are Player 2's cards. You can assume that all hands are 
# valid (no invalid characters or repeated cards), each player's hand is in no specific order, 
# and in each hand there is a clear winner.
# 
# High Card: Highest value card.
# One Pair: Two cards of the same value.
# Two Pairs: Two different pairs.
# Three of a Kind: Three cards of the same value.
# Straight: All cards are consecutive values.
# Flush: All cards of the same suit.
# Full House: Three of a kind and a pair.
# Four of a Kind: Four cards of the same value.
# Straight Flush: All cards are consecutive values of same suit.
# Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
# 
# How many hands does Player 1 win?

module Poker

  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K', 'A']
  SUITS = ['C', 'S', 'H', 'D']
  HANDS = ['high_card', 'one_pair', 'two_pairs', 'three_of_a_kind', 'straight', 
           'flush', 'full_house', 'four_of_a_kind', 'straight_flush', 'royal_flush']

  class Card
    include Comparable

    attr_reader :suit
    attr_reader :value

    def initialize(code)
      raise "Invalid card: #{code}" unless code.length == 2
      @value = code[0,1]
      @suit = code[1,2]
    end

    def to_i
      VALUES.find_index(@value) or raise "Invalid card value #{@value}"
    end

    def <=>(other_card)
      self.to_i <=> other_card.to_i
    end

    def inspect
      "#{value}#{suit}"
    end

  end

  class Hand
    attr_reader :cards

    def initialize(hand)
      raise "Invalid hand: #{hand}" unless hand.split(" ").length == 5
      @cards = hand.split(" ").map { |card| Card.new(card) }.sort
    end

    def inspect
      @cards.map { |card| card.inspect }.join(" ")
    end

    def >(other_hand)
      self.value > other_hand.value
    end

    def value
      type = 'full_house'
      HANDS.find_index(type)
    end

  end
end

h1 = Poker::Hand.new('JC 2S 3S 4S 8C')
h2 = Poker::Hand.new('KD 4S 3S 4D 9C')
p h1 == h2
