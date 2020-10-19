class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  # method de sauvegarde csv
  def save
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  # recupere les fonctions de la method ALL et renvoir le le CSV avec l'id indiqué
  def self.find(gossip)
    all[gossip.to_i]
  end

  def self.update(id, author, content)
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |line|
      all_gossips << Gossip.new(line[0], line[1])
    end
    all_gossips[id.to_i].author = author
    all_gossips[id.to_i].content = content

    CSV.open('./db/gossip.csv', 'w') do |line|
      all_gossips.each do |gossip|
        line << [gossip.author, gossip.content]
      end
    end
  end
end
