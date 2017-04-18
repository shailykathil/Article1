class Comment < ApplicationRecord
  belongs_to :article 
  #belongs_to :commenter,  class_name: "Comment" #-> requires "parent_id" column
   #has_many   :replies, class_name: "Comment", foreign_key: :commenter_id, dependent: :destroy
end
