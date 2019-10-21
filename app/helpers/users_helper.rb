# frozen_string_literal: true

module UsersHelper
  def my_time(object)
    (object.created_at + Time.now.gmt_offset).strftime("%d/%m/%Y %H:%M")
  end
end
