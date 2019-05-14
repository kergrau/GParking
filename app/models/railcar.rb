class Railcar < ApplicationRecord
  before_validation :dni_id, on: :create
  validates :placa, uniqueness: true
  validates :people_id, presence: true
  after_validation :mayus_minus, :on => [:create, :update]

  def dni_id 
    people_id = Person.select(Person.arel_table[:id]).
    where(Person.arel_table[:dni].eq(self.people_id))
    if people_id.blank?
      self.people_id =''
    else
      self.people_id = people_id[0]['id']
    end
  end

  private

    def mayus_minus
      self.placa = placa.upcase
      self.modelo = modelo.upcase
      self.marca = marca.upcase
    end
end
