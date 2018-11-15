module FormatDate
  extend ActiveSupport::Concern

   def calc_date(date)
    date.strftime("%b %d, %Y")
   end

end