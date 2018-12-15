# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users admins
#user tutor  
days = ['lunes', 'martes', 'miercoles' , 'jueves', 'viernes', 'sabado' ]

for i  in 0..(days.count - 1 )
  for j in 7..22
   print("Day: " + days[i] + " hour: " + j.to_s)
    sh = Schedule.new(name: days[i], hour: j)
    sh.save
    
  end
end

topics = ['Normatividad', 'Proyeccion academica', 'Tutoria academica' , 'Servicios de bienestar', 
  'Tramites Administrativos', 'Problemas personales', 'Plan de estudios', 'Otros' ]

=begin 
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
    password: "admin12345678",
    cellphone: Faker::PhoneNumber.cell_phone,
  ) 
  userx.userable= admin #Se asocia el admin con el usuario
  userx.career=  care 
  userx.save
  #El admin puede tener uno o más posts, en este caso solo le asociaomos un post
  
  post = Post.new(name: Faker::Educator.campus , addressedTo:"Everyone", description: Faker::Community.quotes )

  post.admin = admin
  classPost = ClassPost.new(name: Faker::Hipster.word)
  classPost.save
  post.class_post = classPost
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
    password: "tutor12345678",
    cellphone: Faker::PhoneNumber.cell_phone,
  ) 
  usertutor.userable = tutor #Se asocia el admin con el usuario
  usertutor.career =  care 
  usertutor.save
  
  #procedemos a crear el horario disponible del tutor
  #ocuparemos 5 horas
  for i in 0..4
    sh = nil
    sh = Schedule.order("RANDOM()").first 
    tutor.schedules << sh
  end
  #procedemos a crear 3 estudiantes del tutor
  i = 0
  for j in 0..2
    student = Student.new(age: rand(17 .. 25) ,stratus: rand(1 .. 6), pbm: rand(0 .. 100) )
    student.tutor = tutor
    userstudent = User.new(
      name: Faker::Name.first_name ,
      lastname: Faker::Name.last_name,
      email: Faker::Internet.free_email,
      password: "student123456789",
      cellphone: Faker::PhoneNumber.cell_phone,
    ) 
    userstudent.userable= student
    userstudent.career = care
    student.save
    userstudent.save

    st = Student.last
    topic = Topic.new(name: topics [rand(0 .. 7)] )
    topic.save
    
    tutoring = Tutoring.new(type_t: "Presencial", duration: rand(1 .. 5), noteTutor: Faker::HowIMetYourMother.quote )
    tutoring.date = Faker::Date.between(2.days.ago, Date.today)
    tutoring.score  = rand(5)
    tutoring.review = Faker::BackToTheFuture.quote
    tutoring.student =   student
    tutoring.topic_id = topic.id
    tutoring.save
   
    
    
    #a cada estudiante le asignaremos un horariod de 24 horas
    hour = [7 , 9 ,11 , 2 , 4 ]
    shour = hour.sample
    qhour = hour.sample
    
    
    for k in 0..2
  
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
  end
  
end
=end

topic = Topic.find(rand(1..8))
question1 = Question.new(content: "Que diferencia hay entre la asignatura: Sistemas de Informacion y la asignatura: 
  Sistemas de informacion gerencial?")
question1.student = Student.first
question1.topic = topic 
question1.save
answer1 = Answer.new(content: "Sistemas de informacion gerencial es de 4 creditos, mientras que 
  Sistemas de Informacion es de 3")
answer1.question = question1
answer1.user = Tutor.first.user
answer1.save
answer2 = Answer.new(content: "Sistemas de informacion gerencial es ofrecida por la Facultad de Ciencias 
  Economicas") 
answer2.question = question1       
answer2.user = Tutor.first.user
answer2.save

topic = Topic.find(rand(1..8))
question2 = Question.new(content: "Cuales son las condiciones para perder la calidad de estudiante?")
question2.student = Student.last
question2.topic = topic 
question2.save
answer21 = Answer.new(content: "Tener un PAPA por debajo de 2.95")
answer21.question = question2
answer21.user = Tutor.last.user
answer21.save
answer22 = Answer.new(content: "No contar con creditos suficientes para terminar el plan de estudios") 
answer22.question = question2       
answer22.user = Tutor.first.user
answer22.save

topic = Topic.find(rand(1..8))
question3 = Question.new(content: "Cual es la tematica de la asignatura Gobierno Electronico?")
question3.student = Student.last
question3.topic = topic 
question3.save

