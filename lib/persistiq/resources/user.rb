module Persistiq
  class Client
    module User

      def list_users
        get(user_path)
      end

      private

      def user_path(id=nil)
        id ? "users/#{id}/" : "users"
      end

    end
  end
end
