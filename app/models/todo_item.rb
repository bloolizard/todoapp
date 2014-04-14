class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, 	presence: true, 
  						length: { minimum: 2}

  def completed?
  	!completed_at.blank?
  end

  def self.search(search)
  	search_condition = "%" + search + "%"
  	find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  end
  	
end
