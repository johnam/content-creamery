SIGN_UP = { age: 33,
            gender: 'male' }

def sign_up(email)
  SignUp.where(email: email).first
end

def user(email)
  User.where(email: email).first
end

def eventually(options = {})
  timeout = options[:timeout] || 2
  interval = options[:interval] || 0.1
  time_limit = Time.now + timeout

  loop do
    begin
      yield
    rescue RSpec::Expectations::ExpectationNotMetError, StandardError => error
    end

    return if error.nil?
    raise error if Time.now >= time_limit
    sleep interval
  end
end

def to_boolean(words)
  case words
  when 'in to'
    true
  when 'out of'
    false
  end
end
