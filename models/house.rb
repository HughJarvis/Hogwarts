require_relative('../db/sqlrunner.rb')


class House
  
  attr_reader :id
  attr_accessor :name, :logo
  
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end
  
  def save()
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id"
    values = [@name, @logo]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end
  
  
  def self.all
    sql = "SELECT * FROM houses"
    results = SqlRunner.run(sql)
    return results.map{ |house| House.new(house)}
  end
  
  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    return SqlRunner.run(sql, values)[0]
  end
end
