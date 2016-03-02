module LiveChat
  module REST
    class Chats < ListResource
      def initialize(path, client)
        super
        #chats is different than the other resources
        @list_key = 'chats'
      end

      def new(visitor_id, *args)
        @client.post "#{@path}/#{visitor_id}/chat/start", Hash[*args]
      end
    end

    class Chat < InstanceResource
      def send_transcript(*args)
        @client.post "#{@path}/send_transcript", Hash[*args]
        self
      end

      def send_message(visitor_id, *args)
        @client.post "#{@path}/#{visitor_id}/chat/send_mess", Hash[*args]
        self
      end
    end
  end
end
