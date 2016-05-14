# $ rails serverのときに出力するログに色をつける
# http://qiita.com/saiwaki/items/e4908721ac6f95897c70

class ActiveSupport::Logger::SimpleFormatter
  # from activesupport/lib/active_support/core_ext/logger.rb
  def call(severity, time, progname, msg)
    "#{severity_msg_color(severity, msg)} \n"
  end

private

  def severity_msg_color(severity, msg)
    case severity
    when "DEBUG"
      "\033[0;32m[DEBUG]\033[0m \033[0;31m#{String === msg ? msg : msg.inspect}\033[0m"
    when "INFO"
      "\033[1;30m[INFO]\033[0m #{String === msg ? msg : msg.inspect}"
    when "WARN"
      "\033[1;33m[WARNING]\033[0m #{String === msg ? msg : msg.inspect}"
    when "ERROR"
      "\033[0;31m[ERROR]\033[0m #{String === msg ? msg : msg.inspect}"
    when "FATAL"
      "\033[7;31m[FATAL]\033[0m #{String === msg ? msg : msg.inspect}"
    else
      "[#{severity}]" # none
    end
  end
end
