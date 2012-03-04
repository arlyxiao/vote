module VoteHelper
  
  # 根据限选数目限制返回描述字符串
  def vote_select_limit_desc(vote)
    return '单选' if 1 == vote.select_limit
    return "限选#{vote.select_limit}项"
  end
  
end