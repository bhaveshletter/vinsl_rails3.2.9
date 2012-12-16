class Album < ActiveRecord::Base
  attr_accessible :description, :title, :photos_attributes

  belongs_to :user
  has_many :photos, :dependent => :destroy 
  accepts_nested_attributes_for :photos, :allow_destroy => true

  validates :title, :presence   => true,                    
                    :uniqueness => true,
                    :length     => { :within => 2..30 }
  
  validates :description, 
  			:presence   => true,                    
  			:length => { :within => 10..100 }
end
