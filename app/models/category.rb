class Category < ApplicationRecord
  validates :name, presence: { message: "名称不能为空" }
  validates :name, uniqueness: { message: "名称需唯一" }
  has_ancestry orphan_strategy: :destroy
  
  has_many :topics, dependent: :destroy
  before_validation :correct_ancestry
  
  def self.grouped_data
    self.roots.order("weight desc").inject([]) do |result, parent|
      row = []
      row << parent
      row << parent.children.order("weight desc")
      result << row
    end
  end
  
  private
    def correct_ancestry
      self.ancestry = nil if self.ancestry.blank?
    end
end
