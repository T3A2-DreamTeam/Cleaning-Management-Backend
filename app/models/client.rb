class Client < ApplicationRecord
  belongs_to :contact_information
  has_many :jobs, dependent: :destroy
  has_many :notes, dependent: :destroy

  def serialize
    { client_data: {
      client: self,
      contact_information: self.contact_information.api_friendly,
      address: self.contact_information.address.api_friendly,
      address_object: self.contact_information.address,
      notes: self.notes,
    } }
  end
end
