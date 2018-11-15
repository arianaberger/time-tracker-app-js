module FormatDate
  extend ActiveSupport::Concern


  module InstanceMethods
   def calc_date(date)
    date.strftime("%b %d, %Y")
   end
  end

end