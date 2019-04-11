require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student.rb')
require_relative('models/house.rb')
also_reload('models/*')

get '/students' do
  @students = Student.find_all()
  erb(:index)
end


get '/students/new' do
  @houses = House.all()
  erb(:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  redirect '/students'
end

get '/students/:id' do
  id = params[:id]
  @student = Student.find_by_id(id)
  @house = @student.house()
  erb(:show)
end

get '/students/:id/edit' do
  id = params[:id]
  @houses = House.all()
  @student = Student.find_by_id(id)
  erb(:edit)
end

post '/students/:id' do
  student = Student.new(params)
  student.update()
  redirect '/students'
end

post '/students/:id/delete' do
  student = Student.find_by_id(params[:id])
  student.delete()
  redirect '/students'
end
