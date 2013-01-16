# encoding: utf-8

require_dependency 'context'

module Commenter
  include Context

  def create_comment(comment, params)
    in_context do
      comment.user = self
      klass = [Event, Post].detect { |t| params["#{t.name.underscore}_id"] }
      commentable = klass.find(params["#{klass.name.underscore}_id"])
      commentable.comments << comment
      commentable.save
    end
  end
end
