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

  def post_on_wall(user_id)
    @user_id = user_id
    ogp { |p| p.put_wall_post("Hello there!", {
        "name" => "Link name",
        "link" => "http://www.moru.mn",
        "caption" => "I'm posted a new review",
        "description" => "This is a longer description of the attachment"
      })
    }
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

end
