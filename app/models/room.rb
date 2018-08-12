class Room < ApplicationRecord
  belongs_to :user
  belongs_to :package

validate :habitacion_doble
validate :habitacion_triple
validate :habitacion_cuadruple

def habitacion_doble
	if self.tipo_habitacion == "Habitación Doble" && self.num_adultos >= 3
	errors.add(:room_id, "No se pueden más de dos adultos en habitación doble") 
  end 
end


def habitacion_triple
	if self.tipo_habitacion == "Habitación Triple" && self.num_adultos >= 4
	errors.add(:room_id, "No se pueden más de dos adultos en habitación doble") 
  end 
end


def habitacion_cuadruple
	if self.tipo_habitacion == "Habitación Cuádruple" && self.num_adultos >= 5
	errors.add(:room_id, "No se pueden más de dos adultos en habitación doble") 
  end 
end

end
