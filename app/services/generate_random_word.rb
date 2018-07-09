class GenerateRandomWord
  def call
    word=File.open('app/assets/words.txt').read
    word.scrub.split.sample
  end
end