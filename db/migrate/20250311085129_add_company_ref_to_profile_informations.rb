class AddCompanyRefToProfileInformations < ActiveRecord::Migration[7.1]
  def change
    add_reference :profile_informations, :company
  end
end
