class FileReader
  def initialize(file)
    @file = file
    @words =[]
  end

  def read_file
    for line in @file do
      @words.push(line)
    end
  end

  def pick_random_word
    @words.sample
  end

end