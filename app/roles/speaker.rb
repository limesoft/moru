# encoding: utf-8

require_dependency 'context'

module Speaker
  include Context

  def create_topic(topic)
    in_context do
      topic.speaker = self
      topic.save
    end
  end

  def delete_topic(topic)
    in_context do
      topic.speaker = nil
      topic.save
    end
  end
end
