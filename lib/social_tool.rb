# frozen_string_literal: true

# functionality for getting tweets
# rubocop:disable Rails/EnvironmentVariableAccess
module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

    client.user_timeline("cbrenner265").take(6).collect(&:text)
  end
end
# rubocop:enable Rails/EnvironmentVariableAccess
