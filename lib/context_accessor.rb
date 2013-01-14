# encoding: utf-8

module ContextAccessor

  def context
    Thread.current[:context]
  end
end
