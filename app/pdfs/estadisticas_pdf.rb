require 'squid'

class EstadisticasPdf < Prawn::Document

  def initialize  
    super()    
   
    data1 = Student.pbmStatistics 
    data2  = Student.stratusStatistics
    data3  = Student.ageStatistics
    total = Tutoring.count
    result = Tutoring.topicStatistics
    keys = result.keys
    i=0
    while i < keys.length do     
      result[keys[i]] = (result[keys[i]].to_f/total) * 100
      result[keys[i]] = result[keys[i]].round(2)
      i = i +1
    end    
    data4  = result.to_a
    data4.unshift(['Tema','Tutorias (%)'])
    text "ESTADISTICAS", size: 30, style: :bold, align: :center
    move_down 10 
    text "DATOS ESTUDIANTES", size: 15, style: :bold, align: :center
    move_down 25 
    text "Numero de estudiantes por estrato:", size: 15, style: :bold, align: :left
    move_down 10 
    chart Estudiantes_por_Estrato: data2
    move_down 25 
    text "Numero de estudiantes por pbm:", size: 15, style: :bold, align: :left
    move_down 10 
    chart Estudiantes_por_PBM: data1
    move_down 150 
    text "Numero de estudiantes por edad:", size: 15, style: :bold, align: :left
    move_down 10 
    chart Estudiantes_por_Edad: data3 
    move_down 25  
    text "DATOS TUTORIAS", size: 15, style: :bold, align: :center
    move_down 25 
    text "Temas mas frecuentes:", size: 15, style: :bold, align: :left 
    move_down 20    
    table data4, {:header => true, :position => :center} do |table|           
      table.row(0).font_style = :bold
    end    
  end

end