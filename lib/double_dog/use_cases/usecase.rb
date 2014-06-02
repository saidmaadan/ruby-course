require 'ostruct'

module DoubleDog

  class UseCase
    def self.run(params)
      # self.new.run(params)
    end

    def admin_session?(session_id)
      user = DoubleDog.db.get_user_by_session_id(session_id)
      user && user.admin?
    end

    def failure(error_name)
          return :success? => false, :error => error_name
        end

    def success(data)
      return data.merge(:success? => true)
    end

  class UseCaseSuccess < OpenStruct
    def success?
      true
    end
    def error?
      false
    end
  end
  end
end

