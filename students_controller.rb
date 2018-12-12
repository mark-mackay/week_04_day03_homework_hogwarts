require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do # index
  @students = Student.all()
  erb( :index )
end
# new
get '/students/new' do # new
  erb( :new )
end
# post '/students/:id' do # update
#   Student.new( params ).update
#   redirect to '/students'
# end

post '/students' do # create
  @student = Student.new( params )
  @student.save()
  erb( :create )
end

# show
get '/students/:id' do # show
  @student = Student.find( params[:id] )
  erb( :show )
end

post '/students/:id' do # update
  Student.new( params ).update
  redirect to '/students'
end


# create

# edit
get '/students/:id/edit' do # edit
  @student = Student.find( params[:id] )
  erb( :edit )
end

# update

# destroy
post '/students/:id/delete' do # delete
  student = Student.find( params[:id] )
  student.delete()
  redirect to '/students'
end
