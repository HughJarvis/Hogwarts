require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry-byebug')



house1 = House.new({'name' => 'Gryffindor', 'logo' => 'https://i.ebayimg.com/images/g/CBQAAOSwqj1a6pw2/s-l1600.jpg'})

house1.save()

house2 = House.new({'name' => 'Hufflepuff', 'logo' => 'https://starbaseatlanta.com/wp-content/uploads/hp-maab21250.jpg'})

house2.save()

house3 = House.new({'name' => 'Ravenclaw', 'logo' => 'https://images-mm.s3.amazonaws.com/HP_Ravenclaw_Black_Magnet_POP.jpg'})

house3.save()

house4 = House.new({'name' => 'Slytherin', 'logo' => 'https://cdn.shopify.com/s/files/1/2393/5817/products/Harry-Potter-Slytherin-Crest-Kids-T-Shirt-Logo-Web_1400x.jpg'})

house4.save()

student1 = Student.new({'first_name' => 'Harry', 'second_name' => 'Potter', 'house_id' => house1.id, 'age' => 11})
student1.save()

student2 = Student.new({'first_name' => 'Draco', 'second_name' => 'Malfoy', 'house_id' => house4.id, 'age' => 11})
student2.save()


binding.pry
nil
