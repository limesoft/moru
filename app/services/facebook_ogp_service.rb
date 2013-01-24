# encoding: utf-8

##
# Facebook Open Graphic Protocol Service
#

class FacebookOgpService

  def post_topic(user_id, topic_id, topic_url)
    @user_id = user_id
    ogp { |p| p.put_connections("me", "mongolian_rubyist:create", topic: topic_url) }
  end
  handle_asynchronously :post_topic, run_at: Proc.new { 10.seconds.from_now }

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

end
