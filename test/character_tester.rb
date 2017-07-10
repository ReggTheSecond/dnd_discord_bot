require "test/unit"
require_relative '../src/character.rb'

class CharacterTester < Test::Unit::TestCase
  def test_two_stats_are_not_fifteen_or_above()
    test_character = Character.new()
    test_character.strength = 14
    test_character.constitution = 14
    test_character.dexterity = 14
    test_character.intelligence = 14
    test_character.wisdom = 14
    test_character.charisma = 14
    assert_equal(true, test_character.two_stats_are_not_fifteen_or_above())
    test_character.charisma = 15
    assert_equal(true, test_character.two_stats_are_not_fifteen_or_above())
    test_character.wisdom = 15
    test_character.charisma = 14
    assert_equal(true, test_character.two_stats_are_not_fifteen_or_above())
    test_character.intelligence = 15
    test_character.wisdom = 14
    assert_equal(true, test_character.two_stats_are_not_fifteen_or_above())
    test_character.dexterity = 15
    test_character.intelligence = 14
    assert_equal(true, test_character.two_stats_are_not_fifteen_or_above())
    test_character.constitution = 15
    test_character.dexterity = 14
    assert_equal(true, test_character.two_stats_are_not_fifteen_or_above())
    test_character.strength = 15
    test_character.constitution = 14
    assert_equal(true, test_character.two_stats_are_not_fifteen_or_above())
    test_character.constitution = 15
    assert_equal(false, test_character.two_stats_are_not_fifteen_or_above())
    test_character.strength = 14
    test_character.constitution = 14
    test_character.dexterity = 15
    test_character.intelligence = 15
    assert_equal(false, test_character.two_stats_are_not_fifteen_or_above())
    test_character.dexterity = 14
    test_character.intelligence = 14
    test_character.wisdom = 15
    test_character.charisma = 15
    assert_equal(false, test_character.two_stats_are_not_fifteen_or_above())
  end
end
