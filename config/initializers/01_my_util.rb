module MyUtil
  # LIKEのエスケープの実装
  # http://easyramble.com/escape-like-on-rails-active-record.html
  # 使い方はこんな感じ
  # ApiKey.where("api_key LIKE ?", "%#{MyUtil.escape_like(@keyword)}%")
  def self.escape_like(string)
    string.gsub(/[\\%_]/){|m| "\\#{m}"}
  end 
end
