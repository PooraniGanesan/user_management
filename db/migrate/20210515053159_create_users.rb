class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension "hstore"
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.hstore :address
      t.string :role, default: 'Employee'
      t.string :phone_number

      t.timestamps
    end
  end
end
