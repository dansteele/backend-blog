class Comment < ActiveRecord::Base
  belongs_to :author
  belongs_to :post

  after_create do
    txt = SendSms.add(self.body)
  end

end