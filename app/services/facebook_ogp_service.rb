# encoding: utf-8

require_dependency 'ogp/facebook/post'

##
# Facebook Open Graphic Protocol Service
#

class FacebookOgpService

  def post_topic(user_id, topic_id, topic_url)
    @user_id = user_id
    # TODO: check permission here
    ogp { |p| p.put_connections("me", "mongolian_rubyist:create", topic: topic_url) }
  end
  handle_asynchronously :post_topic, run_at: Proc.new { 10.seconds.from_now }

  def post_on_wall(user_id, topic_id, topic_url)
    @user_id = user_id
    # TODO: check permission here
    fb_post = Ogp::Facebook::Post.new(topic, topic_url)
    ogp { |p| p.put_wall_post("Би MORU дээр яригдах \"#{topic.title}\" сэдэвт санал өглөө.", fb_post.to_json) }
  end
  handle_asynchronously :post_on_wall

  private
    def ogp
      @ogp ||= Koala::Facebook::API.new(user.try(:get_facebook_token))
      block_given? ? yield(@ogp) : @ogp
    rescue Koala::Facebook::APIError => e
      Rails.logger.info e.to_s
      nil
    end

    def user
      @user ||= User.find(@user_id).extend OgpContext
    end

    def topic(id)
      @topic ||= Topic.find(id)
    end

end
