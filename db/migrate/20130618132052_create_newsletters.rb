class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :name, default: ''
      t.string :email, default: ''

      t.timestamps
    end

    add_index :newsletters, :name
    add_index :newsletters, :email, unique: true
  end
end
