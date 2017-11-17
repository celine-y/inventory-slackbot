module InventoryBot
  class Bot < SlackRubyBot::Bot
    match /(?<office>[^\s]*)(\s)*office(\s)*out(\s)*of(\s)*(?<item>.*)/ do |client, data, match|
      begin
        officeName = "#{match[:office]}"
        client.web_client.chat_postMessage(
          channel: "##{officeName}",
          text: "Someone requested for #{match[:item]}",
          as_user: true
        )
      rescue Slack::Web::Api::Errors::SlackError => ex
        client.web_client.chat_postMessage(
          channel: data.channel,
          text: "Sorry, a slack channel for that office (#{officeName}) does not exist",
          as_user: true
        )
      end
    end
  end
end
