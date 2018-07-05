class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.string :company_mailing_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :company_phone_number
      t.string :password
      t.string :company_type
      t.string :user_name

      t.timestamps
    end
  end
end
