module LiveChat
  module REST
    class Chats < ListResource
      def initialize(path, client)
        super
        #chats is different than the other resources
        @list_key = 'chats'
      end
    end

    class Chat < InstanceResource
      def send_transcript(*args)
        @client.post "#{@path}/send_transcript", Hash[*args]
        self
      end

      def start(visitor_id, license_id, welcome_message, *args)
        @client.post "#{@path}/#{visitor_id}/chat/start", "license_id=#{license_id}&welcome_message=#{welcome_message}&" + Hash[*args]
      end
    end
  end
end
