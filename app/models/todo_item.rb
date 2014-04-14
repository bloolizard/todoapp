class TodoItem < ActiveRecord::Base
  searchkick
  belongs_to :todo_list

  validates :content, 	presence: true, 
  						length: { minimum: 2}



  def completed?
  	!completed_at.blank?
  end

  def self.search(query)
    where("content like ?", "%#{query}%")
  end
  	
end
