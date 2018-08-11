json.extract! room, :id, :tipo_habitacion, :num_adultos, :num_menores, :num_bebes, :user_id, :package_id, :created_at, :updated_at
json.url room_url(room, format: :json)
