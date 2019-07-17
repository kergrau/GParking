class Railcar < ApplicationRecord
  has_many :records
  before_validation :dni_a_id, on: :create
  validates :placa, uniqueness: true
  validates :person_id, presence: true
  after_validation :mayus_minus, :on => [:create, :update]

  def dni_a_id 
    # p person = Person.select(Person.arel_table[:id]).
    # where(Person.arel_table[:dni].eq(person_id))
    p person = Person.select(:id).where(dni: self.person_id)

    if person.blank?
      self.person_id =''
    else
      self.person_id = person[0]['id']
    end
  end

  private

    def mayus_minus
      self.placa = placa.upcase
      self.modelo = modelo.upcase
      self.marca = marca.upcase
    end
end
