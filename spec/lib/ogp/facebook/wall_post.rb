# encoding: utf-8

require 'spec_helper'

module Ogp
  module Facebook
    describe WallPost do
      let(:topic) { Fabricate(:topic) }
      let(:topic_url) { Faker::Internet.domain_name }
      let(:post) { WallPost.new(topic, topic_url) }

      it "#to_hash" do
        {
          "name" => topic.title,
          "link" => topic_url,
          "description" => topic.content
        }.should eq(post.to_hash)
      end
    end
  end
end
