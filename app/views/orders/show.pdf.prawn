prawn_document() do |pdf|
  logo = "#{Rails.root}/app/assets/images/logo2.jpg"
	pdf.image logo, width: 120, position: :center
	pdf.move_down 60
	pdf.text "Atn. #{@order.user.name}"
	pdf.move_down 20
	pdf.text "Gracias por reservar con nostros la experiencia  #{@order.block.experience.nombre}.", size: 10
	pdf.text "Para Inter Travex será un honor tenerte a ti y tu familia con nosotros viviendo esta gran aventura.", size: 10
	pdf.move_down 20
	pdf.text "Estos son los detalles de tu compra: ", size: 10, style: :italic
	pdf.move_down 20
	# aqui
data = [ 
 ["Nombre de Experiencia:", "Tipo de Experiencia:"],
 ["#{@order.block.experience.nombre}", "#{@order.block.experience.categoria}"],
 ["", ""],
 ["Fecha:", " Lugar de Salida:"],
 ["#{@block.fecha_salida.strftime(" %d-%b-%Y")}  - #{@block.fecha_regreso.strftime(" %d-%b-%Y")} ", "#{@block.lugar_salida}"],
 ["", ""],
 ["Hora de Salida:", ""],
 ["#{@block.hora_salida.strftime("%H:%M")} hrs.", ""],
 ["", ""],
 ["", ""],
 ["", ""]
 ]

pdf.table data, :position => :center, :width => 550, :row_colors => ["FFFFFF", "ffffff"], :column_widths => [275, 275], :cell_style => { :font => "Helvetica", :size => 10, :border_color => "ffffff" }


	# aqui
	pdf.text "Descripción:", size: 10, style: :bold
	pdf.text "#{@block.experience.descripcion} ", size: 10
	pdf.move_down 15

	# aqui
	pdf.text "Itinerario:", size: 10, style: :bold
	pdf.text "#{@block.experience.itinerario} ", size: 10
	pdf.move_down 15

	# aqui
	pdf.text "¿Qué incluye?:", size: 10, style: :bold
	pdf.text "#{@block.experience.incluye} ", size: 10
	pdf.move_down 15

	pdf.start_new_page

	pdf.move_down 20

	pdf.text "Pasajeros", size: 13, style: :bold, align: :center
	pdf.move_down 10
	pdf.text "Favor de enviar esta hoja por correo a experiencias@intertravex.com con todos los datos completos", align: :center, size: 10
	pdf.move_down 45
	# aqui
data = [ 
 ["Nombre de Experiencia:", "Tipo de Experiencia:"],
 ["#{@order.block.experience.nombre}", "#{@order.block.experience.categoria}"],
 ["", ""],
 ["Fecha:", " Lugar de Salida:"],
 ["#{@block.fecha_salida.strftime(" %d-%b-%Y")}  - #{@block.fecha_regreso.strftime(" %d-%b-%Y")} ", "#{@block.lugar_salida}"],
 ["", ""],
 ["Hora de Salida:", ""],
 ["#{@block.hora_salida.strftime("%H:%M")} hrs.", ""],
 ["", ""],
 ["", ""],
 ["", ""]
 ]

pdf.table data, :position => :center, :width => 550, :row_colors => ["FFFFFF", "ffffff"], :column_widths => [275, 275], :cell_style => { :font => "Helvetica", :size => 10, :border_color => "ffffff" }

pdf.text "ADULTOS: (#{@order.many})", style: :bold
pdf.move_down 10

	# aqui
data = [ 
 ["Nombre", "Edad", "Teléfono", "Correo"]
 ]
pdf.table data, :position => :center, :width => 500, :row_colors => ["FFFFFF", "ffffff"], :column_widths => [125, 125, 125, 125], :cell_style => { :font => "Helvetica", :size => 10, :border_color => "f3f3f3" }

@order.many.times do |time|
	data = [ 
 ["", "", "", ""]
 ]
pdf.table data, :position => :center, :width => 500, :row_colors => ["FFFFFF", "ffffff"], :column_widths => [125, 125, 125, 125], :cell_style => { :font => "Helvetica", :size => 10, :border_color => "f3f3f3", :height => 15 }
end

pdf.move_down 30
# nninos

pdf.text "NIÑOS: (#{@order.many_n})", style: :bold
pdf.move_down 10

	# aqui
data = [ 
 ["Nombre", "Edad", "Teléfono", "Correo"]
 ]
pdf.table data, :position => :center, :width => 500, :row_colors => ["FFFFFF", "ffffff"], :column_widths => [125, 125, 125, 125], :cell_style => { :font => "Helvetica", :size => 10, :border_color => "f3f3f3" }

@order.many_n.times do |time|
	data = [ 
 ["", "", "", ""]
 ]
pdf.table data, :position => :center, :width => 500, :row_colors => ["FFFFFF", "ffffff"], :column_widths => [125, 125, 125, 125], :cell_style => { :font => "Helvetica", :size => 10, :border_color => "f3f3f3", :height => 15 }
end

end