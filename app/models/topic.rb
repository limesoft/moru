# encoding: utf-8

class Topic < ActiveRecord::Base

  belongs_to :user
  belongs_to :speaker, class_name: 'User'

end
