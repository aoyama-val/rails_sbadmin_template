# バリデーション前に全てのカラムの前後の空白を除去するコンサーン
#
# 使い方：
#
# class HogeModel < ActiveRecord::Base
#   include TrimBeforeValidation
# end
module TrimBeforeValidation extend ActiveSupport::Concern

  included do
    before_save :trim_before_validation
  end

  def trim_before_validation
    string_columns = self.class.columns.select { |column| column.type == :string }
    string_columns.each do |string_column| 
      attribute = string_column.name     
      value = send(attribute)        
      if value.present?          
        send("#{attribute}=", value.strip)        
      end      
    end      
    return true
  end
end
