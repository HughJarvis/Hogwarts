require_relative('../db/sqlrunner.rb')

class Student
  
  attr_reader :id
  attr_accessor :first_name, :second_name, :house_id, :age
  
  
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end
  
  def save()
    sql = "INSERT INTO students (first_name, second_name, house_id, age)
          VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @second_name, @house_id, @age]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM students"
    results = SqlRunner.run(sql)
    return results.map{ |student| Student.new(student) }
  end
  
  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    value = [id]
    student = SqlRunner.run(sql, value)[0]
    return Student.new(student)
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    house = SqlRunner.run(sql, values)[0]
    return House.new(house)
  end
  
  def update()
    sql = "UPDATE students SET (first_name, second_name, house_id, age)
          = ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @second_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end
  
end
