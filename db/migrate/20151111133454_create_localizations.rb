class CreateLocalizations < ActiveRecord::Migration
  def change
    create_table :localizations do |t|
      t.string :link
      t.string :address
      t.string :image
      t.timestamps
    end
  end
end
