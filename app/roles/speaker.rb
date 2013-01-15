# encoding: utf-8

require_dependency 'context'

module Speaker
  include Context

  def create_and_assign_topic(topic)
    in_context do
      topic.speaker = self
      topic.user = self
      topic.save
    end
  end

  def create_topic(topic)
    in_context do
      topic.user = self
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
