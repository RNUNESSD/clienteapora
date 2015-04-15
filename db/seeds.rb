#encoding: utf-8

models = {
  'ArticleCategory' => 'Categoria de Conteúdo',
  'Article' => 'Conteúdo',
  'Banner' => 'Banner',
  'BannerCategory' => 'Categoria de Banner',
  'Newsletter' => 'Newsletter',
  'Page' => 'Página',
  'PageImage' => 'Imagens para Página',
  'Role' => 'Grupo',
  'User' => 'Usuário'
}

actions = { 'create' => 'adicionar', 'read' => 'visualizar', 'update' => 'editar', 'destroy' => 'remover' }

pages = ['Quem Somos']

article_categories = ['Serviços']

banner_categories = [{ name: 'Test', image_width: 20, image_height: 20 }]


models.each do |object|
  actions.each do |action|
    Permission.find_or_create_by(object_type: object[0], action_name: action[0]) do |r|
      r.description = "#{action[1].camelize} #{object[1]}"
    end
  end
end

%w(Admin Redação Cliente).each do |role|
  Role.find_or_create_by(name: role)
end

User.find_or_create_by(email: 'matheus@corp.agenciaacerte.com') do |u|
  u.password = '1234567*'
  u.is_active = true
  u.roles << Role.where(name: 'Admin').first
  u.is_admin = true
end

User.find_or_create_by(email: 'redacao@corp.agenciaacerte.com') do |u|
  u.password = '1234567*'
  u.is_active = true
  u.roles << Role.where(name: 'Redação').first
end

pages.each do |page|
  Page.find_or_create_by(title: page) do |p|
    p.content = 'Falta Conteudo'
  end
end

article_categories.each do |name|
  ArticleCategory.find_or_create_by(name: name)
end

banner_categories.each do |banner|
  BannerCategory.find_or_create_by(banner)
end

namespace :dev do
  User.find_or_create_by(email: 'desenvolvimento@agenciaacerte.com') do |u|
    u.password = '1234567*'
    u.is_active = true
    u.roles << Role.where(name: 'Admin').first
    u.is_admin = true
  end
end
