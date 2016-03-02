module LiveChat
  module REST
    class Chats < ListResource
      def initialize(path, client)
        super
        #chats is different than the other resources
        @list_key = 'chats'
      end

      def new(visitor_id, *args)
        @client.post "#{@path}/visitors/#{visitor_id}/chat/start", Hash[*args]
      end
    end

    class Chat < InstanceResource
      def send_transcript(*args)
        @client.post "#{@path}/send_transcript", Hash[*args]
        self
      end

      def get_pending_messages(visitor_id, *args)
        @client.post "#{@path}/visitors/#{visitor_id}/chat/get_pending_messages", Hash[*args]
      end

      def send_message(visitor_id, *args)
        @client.post "#{@path}/visitors/#{visitor_id}/chat/send_message", Hash[*args]
      end

      def close(visitor_id, *args)
        @client.post "#{@path}/visitors/#{visitor_id}/chat/close", Hash[*args]
      end
    end
  end
end
