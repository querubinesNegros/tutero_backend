# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users admins
#user tutor  
10.times do
  #Creamos una carrera
  care =  Career.new( name: Faker::Educator.course)
  care.save
  #Creamos un admin junto a su usuario correspondiente
  admin = Admin.new
  admin.save
 # print(career.id)
  userx = User.new(
    name: Faker::Name.first_name ,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: Faker::Internet.password,
    cellphone: Faker::PhoneNumber.cell_phone,
  ) 
  userx.userable= admin #Se asocia el admin con el usuario
  userx.career=  care 
  userx.save
  #El admin puede tener uno o más posts, en este caso solo le asociaomos un post
  
  post = Post.new(name: Faker::Educator.campus , addressedTo:"Everyone", description: Faker::Community.quotes )

  post.admin = admin
  post.class_post = ClassPost.first
  post.save
  #El post tiene uno o varios archivos
  for i in 0..rand(3)
    sfile = Filep.new(name: Faker::File.extension )
    sfile.post = post
    randnumber =  rand(1 .. 4)
    if randnumber == 1 || randnumber == 2 
      image = Image.new(path: Faker::File.file_name('dataimage/image',Faker::Name.first_name , 'jpg'))
      sfile.filepable = image
      image.save
    else
      pdf = Pdf.new(path: Faker::File.file_name('dataimage/pdf',Faker::Name.first_name , 'pdf'))
      sfile.filepable = pdf
      pdf.save
    end
    sfile.save
  end
  #creamos un tutor de la carrera que creamos pero necesitamos hacer otro usuario
  tutor = Tutor.new(ammountStudents: 3)
  tutor.save
  usertutor = User.new(
    name: Faker::Name.first_name ,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: Faker::Internet.password,
    cellphone: Faker::PhoneNumber.cell_phone,
  ) 
  usertutor.userable= tutor #Se asocia el admin con el usuario
  usertutor.career=  care 
  usertutor.save
  
  #procedemos a crear el horario disponible del tutor
  #ocuparemos 5 horas
  for i in 0..4
    sh = nil
    sh = Schedule.order("RANDOM()").first 
    print(sh.hour.to_s + "\n")
    tutor.schedules << sh
    
  end
  #procedemos a crear 3 estudiantes del tutor
   
  for i in 0..2
    student = Student.new(age: rand(17 .. 25) ,stratus: rand(1 .. 6), pbm: rand(0 .. 100) )
    student.tutor= tutor
    userstudent = User.new(
      name: Faker::Name.first_name ,
      lastname: Faker::Name.last_name,
      email: Faker::Internet.free_email,
      password: Faker::Internet.password,
      cellphone: Faker::PhoneNumber.cell_phone,
    ) 
    userstudent.userable= student
    userstudent.career = care
    student.save
    userstudent.save
    #a cada estudiante le asignaremos un horariod de 24 horas
    hour = [7 , 9 ,11 , 2 , 4 ]
    shour = hour.sample
    qhour = hour.sample
    for i in 0..2
  
      lunes = Schedule.where(name: 'lunes', hour: (shour + 2 *i))
      martes = Schedule.where(name: 'martes', hour: (qhour + 2 *i))
      miercoles = Schedule.where(name: 'miercoles', hour: (shour + 2 *i))
      jueves = Schedule.where(name: 'jueves', hour: (qhour + 2 *i))
  
      student.schedules << lunes
      student.schedules << martes
      student.schedules << miercoles
      student.schedules << jueves      
    end
    #finalmente a cada estudiante le asignamos una tutoria    
    tutoring = Tutoring.new(topic_id: 1, type_t: "Presencial", duration: rand(1 .. 5), noteTutor: Faker::HowIMetYourMother.quote )
    tutoring.date = Faker::Date.between(2.days.ago, Date.today)
    tutoring.score  = rand(5)
    tutoring.review = Faker::BackToTheFuture.quote
    tutoring.schedule = tutor.schedules.first
    tutoring.student =   student
    tutoring.save
    
  end

end

=begin
#Puebla Schedule 
days = ['lunes', 'martes', 'miercoles' , 'jueves', 'viernes', 'sabado' ]

for i  in 0..(days.count)
  for j in 7..22
    #print("Day: " + days[i] + " hour: " + j.to_s)

    sh = Schedule.new(name: days[i], hour: j)
    sh.save
    
  end
end
=end
