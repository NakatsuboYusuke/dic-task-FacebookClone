module ApplicationHelper

  # => 原則的には、viewに共通する処理を書く。controllerに実行する処理を書いても良い。
  def convert_birthday_time(birthday)
    birthday.strftime("%Y年%m月%d日")
    # AM => 午前 PM => 午後 に変換したい
  end

end
