require_relative '../lib/countdown_song'
require_relative './spec_helper'

describe CountdownSong do
  context "#verses" do
    it "will output a subset of song verses" do
      expected =
        "This is verse 99.\n" + "\n" +
          "This is verse 98.\n" + "\n" +
          "This is verse 97.\n"
      expect(expected).to eq CountdownSong.new(verse_template: VerseFake).verses(99, 97)
    end
  end

  context "#verse" do
    it "will output a verse" do
      expected = "This is verse 500.\n"
      expect(expected).to eq CountdownSong.new(verse_template: VerseFake).verse(500)
    end
  end

  context "song" do
    it "will output the full song" do
      expected =
        "This is verse 47.\n" + "\n" +
          "This is verse 46.\n" + "\n" +
          "This is verse 45.\n" + "\n" +
          "This is verse 44.\n" + "\n" +
          "This is verse 43.\n"
      expect(expected).to eq CountdownSong.new(verse_template: VerseFake, min: 43, max: 47).song
    end
  end
end