require 'squid'

class EstadisticasPdf < Prawn::Document

  def initialize  
    super()
    data1  = Student.pbmStatistics 
    data2  = Student.stratusStatistics
    data3  = Student.ageStatistics
    data4  = Tutoring.topicStatistics
    text "ESTADISTICAS", size: 50, style: :bold, align: :center
    move_down 40 
    text "DATOS ESTUDIANTES", size: 30, style: :bold, align: :left
    text "Numero de estudiantes ", size: 30, style: :bold, align: :left
    chart Estudiantes_por_Estrato: data2
    chart Estudiantes_por_PBM: data1
    chart Estudiantes_por_Edad: data3  
    #chart Temas_mas_frecuentes: data4  
  end

  
    
  

end