require_relative '../lib/countdown_song'
require_relative './spec_helper'

describe BottleVerse do
  it "will output general_rule_upper_bound" do
    expected =
      "99 bottles of beer on the wall, " +
        "99 bottles of beer.\n" +
        "Take one down and pass it around, " +
        "98 bottles of beer on the wall.\n"
    expect(expected).to eq BottleVerse.lyrics(99)
  end

  it "will output general_rule_lower_bound" do
    expected =
      "3 bottles of beer on the wall, " +
        "3 bottles of beer.\n" +
        "Take one down and pass it around, " +
        "2 bottles of beer on the wall.\n"
    expect(expected).to eq BottleVerse.lyrics(3)
  end

  it "will output a 7 verse song" do
    expected = "7 bottles of beer on the wall, " + "7 bottles of beer.\n" +
      "Take one down and pass it around, " + "1 six-pack of beer on the wall.\n"
    expect(expected).to eq BottleVerse.lyrics(7)
  end

  it "will output a 6 verse song" do
    expected = "1 six-pack of beer on the wall, " + "1 six-pack of beer.\n" +
        "Take one down and pass it around, " + "5 bottles of beer on the wall.\n"
    expect(expected).to eq BottleVerse.lyrics(6)
  end

  it "will output a 2 verse song" do
    expected =
      "2 bottles of beer on the wall, " +
        "2 bottles of beer.\n" +
        "Take one down and pass it around, " +
        "1 bottle of beer on the wall.\n"
    expect(expected).to eq BottleVerse.lyrics(2)
  end
  it "will output a 1 verse song" do
    expected =
      "1 bottle of beer on the wall, " +
        "1 bottle of beer.\n" +
        "Take it down and pass it around, " +
        "no more bottles of beer on the wall.\n"
    expect(expected).to eq BottleVerse.lyrics(1)
  end
  it "will output a 0 verse song" do
    expected =
      "No more bottles of beer on the wall, " +
        "no more bottles of beer.\n" +
        "Go to the store and buy some more, " +
        "99 bottles of beer on the wall.\n"
    expect(expected).to eq BottleVerse.lyrics(0)
  end
end