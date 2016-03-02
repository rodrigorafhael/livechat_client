module LiveChat
  module REST
    class Visitors < ListResource
      def chatting
        list
      end

      def new(visitor_id, *args)
        @client.post "#{@path}/#{visitor_id}/chat/start", Hash[*args]
      end

      def get_pending_messages(visitor_id, *args)
        @client.post "#{@path}/#{visitor_id}/chat/get_pending_messages", Hash[*args]
      end

      def send_message(visitor_id, *args)
        @client.post "#{@path}/#{visitor_id}/chat/send_message", Hash[*args]
      end

      def close(visitor_id, *args)
        @client.post "#{@path}/#{visitor_id}/chat/close", Hash[*args]
      end
    end

    class Visitor < InstanceResource
      def add_details(params={})
        yield params if block_given?
        @client.post(@path, params)
        self
      end
    end
  end
end
