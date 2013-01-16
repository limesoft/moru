# encoding: utf-8

require_dependency 'context'

module Commenter
  include Context

  def create_comment(comment, commentable)
    in_context do
      comment.user = self
      commentable.comments << comment
      commentable.save
    end
  end
end
