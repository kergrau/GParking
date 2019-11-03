# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Space.create([{sp_floor: 1, sp_number: 1, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 2, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 3, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 4, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 5, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 6, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 7, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 8, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 9, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 10, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 11, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 12, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 13, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 14, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 15, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 16, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 17, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 18, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 19, sp_state: false, sp_type: 'CARRO', parking_id: 1},
{sp_floor: 1, sp_number: 20, sp_state: false, sp_type: 'MOTO', parking_id: 1},
{sp_floor: 1, sp_number: 21, sp_state: false, sp_type: 'MOTO', parking_id: 1},
{sp_floor: 1, sp_number: 22, sp_state: false, sp_type: 'MOTO', parking_id: 1},
{sp_floor: 1, sp_number: 23, sp_state: false, sp_type: 'MOTO', parking_id: 1},
{sp_floor: 1, sp_number: 24, sp_state: false, sp_type: 'MOTO', parking_id: 1},
{sp_floor: 1, sp_number: 25, sp_state: false, sp_type: 'MOTO', parking_id: 1},
{sp_floor: 2, sp_number: 25, sp_state: false, sp_type: 'MOTO'}])

Price.create([{valor: 77, tipo_carro: 'CARRO', hora_inicio: '00:00:00',
              hora_fin: '05:59:59', estado: true, parking_id: 1 },
              { valor: 90, tipo_carro: 'CARRO', hora_inicio: '06:00:00',
               hora_fin: '11:59:59', estado: true, parking_id: 1 },
              { valor: 93, tipo_carro: 'CARRO', hora_inicio: '12:00:00',
               hora_fin: '17:59:59', estado: true, parking_id: 1 },
              { valor: 80, tipo_carro: 'CARRO', hora_inicio: '18:00:00',
               hora_fin: '23:59:59', estado: true, parking_id: 1 },
              { valor: 45, tipo_carro: 'MOTO', hora_inicio: '00:00:00',
               hora_fin: '05:59:59', estado: true, parking_id: 1 },
              { valor: 53, tipo_carro: 'MOTO', hora_inicio: '06:00:00',
                hora_fin: '11:59:59', estado: true, parking_id: 1 },
              { valor: 60, tipo_carro: 'MOTO', hora_inicio: '12:00:00',
                hora_fin: '17:59:59', estado: true, parking_id: 1 },
              { valor: 65, tipo_carro: 'MOTO', hora_inicio: '18:00:00',
                hora_fin: '23:59:59', estado: true, parking_id: 1 }])
