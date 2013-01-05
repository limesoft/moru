# encoding: utf-8

Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :basic
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find(id)
end
