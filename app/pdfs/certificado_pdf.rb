class CertificadoPdf < Prawn::Document

  def initialize(tutor)  
    super()
    @tutor  = tutor 
    image "#{Rails.root}/app/assets/images/PNG_LOGOSIMBOLO_UNAL.png", :width => 300, :height => 200, :position => :center
    move_down 10 
    titulo
    move_down 40 
    text "Fecha: #{DateTime.now.strftime('%m-%d-%Y')}" , size: 20, style: :bold, align: :center
    text "Nombre del tutor: #{@tutor.user.name + ' ' + @tutor.user.lastname}" , size: 20, style: :bold, align: :center
    text "Periodo: #{'Del ' + (DateTime.now-30).strftime('%m-%d-%Y') + ' al ' + (DateTime.now).strftime('%m-%d-%Y')}", size: 20, style: :bold, align: :center      
    text "Numero de horas realizadas: #{Tutor.totalHoursTutorings(@tutor.id)}" , size: 20, style: :bold, align: :center
    text "Calificacion obtenida: #{Tutor.promScoreTutorings(@tutor.id)}" , size: 20, style: :bold, align: :center
  end

  def titulo
    text "CERTIFICADO HORAS DE TUTORIA", size: 50, style: :bold, align: :center
  end

end