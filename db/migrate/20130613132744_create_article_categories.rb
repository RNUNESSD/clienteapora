class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :name
      t.boolean :is_active, default: true
    end

    add_index :article_categories, :name, :unique => true
    add_index :article_categories, :is_active
  end
end
