class Comment < ApplicationRecord
  belongs_to :article 
  has_many :replies, dependent: :destroy
  #belongs_to :commenter,  class_name: "Comment" #-> requires "parent_id" column
   #has_many   :replies, class_name: "Comment", foreign_key: :commenter_id, dependent: :destroy
end
