class CreateEmailContacts < ActiveRecord::Migration
  def change
    create_table :email_contacts do |t|
      t.string :email
      t.references :email_category
      t.timestamps
    end
    add_foreign_key :email_contacts, :email_categories
  end
end
