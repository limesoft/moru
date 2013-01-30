# encoding: utf-8

module Ogp
  module Facebook
    class WallPost

      def initialize(topic, topic_url)
        @topic = topic
        @topic_url = topic_url
      end

      def to_hash
        {
          "name" => @topic.title,
          "link" => @topic_url,
          "description" => @topic.content
        }
      end
    end
  end
end