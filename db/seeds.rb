#encoding: utf-8

models = { 
  'ArticleCategory' => 'Categoria de Conteúdo',
  'Article' => 'Conteúdo', 
  'Banner' => 'Banner',
  'BannerCategory' => 'Categoria de Banner',
  'Newsletter' => 'Newsletter',
  'Page' => 'Página',
  'Role' => 'Grupo',
  'User' => 'Usuário' }

actions = { 'create' => 'adicionar', 'read' => 'visualizar', 'update' => 'editar', 'destroy' => 'remover' }

pages = ['Quem Somos']

article_categories = ['Serviços']

banner_categories = []


models.each do |object|
  actions.each do |action|
    Permission.find_or_create_by_object_type_and_action_name(object_type: object[0], action_name: action[0]) do |r|
      r.description = "#{action[1].camelize} #{object[1]}"
    end
  end
end

%w(Admin Redação Cliente).each do |role|
  Role.find_or_create_by_name(name: role)
end

User.find_or_create_by_email('matheus@corp.agenciaacerte.com', password: '1234567*', is_active: true) do |u|
  u.roles << Role.where(name: 'Admin').first
  u.is_admin = true
end

User.find_or_create_by_email('redacao@corp.agenciaacerte.com', password: '1234567*', is_active: true) do |u|
  u.roles << Role.where(name: 'Redação').first
end

pages.each do |page|
  Page.find_or_create_by_title(page, content: 'Falta Conteudo')
end

article_categories.each do |name|
  ArticleCategory.find_or_create_by_name(name: name)
end

banner_categories.each do |name|
  BannerCategory.find_or_create_by_name(name: name)
end

namespace :dev do
  User.find_or_create_by_email('desenvolvimento@agenciaacerte.com', password: '1234567*', is_active: true) do |u|
    u.roles << Role.where(name: 'Admin').first
    u.is_admin = true
  end
end
