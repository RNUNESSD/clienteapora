class Admin::ArticlesController < Admin::ResourceController
  belongs_to :article_category, parent_class: ArticleCategory

  def update
    update! { edit_resource_url }
  end
end
