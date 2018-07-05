class GenerateRandomWord

  def words
    line_num=0
    word = []
    text=File.open('app/assets/words.txt').read
    text.each_line do |line|
      word[line_num] = line
      line_num += 1
    end
    word.sample
  end
end