class CreateEmailCategories < ActiveRecord::Migration
  def change
    create_table :email_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
