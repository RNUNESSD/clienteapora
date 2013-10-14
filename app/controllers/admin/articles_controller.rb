class Admin::ArticlesController < Admin::ResourceController
  belongs_to :article_category
end
