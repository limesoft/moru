# encoding: utf-8

require 'json'

module Ogp
  module Facebook
    class Post

      def initialize(topic, topic_url)
        @topic = topic
        @topic_url = topic_url
      end

      def to_json(*args)
        {
          "name" => @topic.title,
          "link" => @topic_url
          "description" => @topic.content
        }.to_json(*args)
      end

    end
  end
end
