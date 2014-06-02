require 'sqlite3'

module DoubleDog
  module Database

    class DB

      def initialize
        ActiveRecord::Base.establish_connection(
          :adapter => 'sqlite3',
          :database => 'database_example.db'
        )
      end

      class User < ActiveRecord::Base
        has_many :Items
        has_many :Orders
      end

      class Item < ActiveRecord::Base
        belongs_to :User
      end
      class Order < ActiveRecord::Base
        belongs_to :User
        belongs_to :Items
      end
    end
  end
end
