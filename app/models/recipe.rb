class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :ingredients
	has_many :directions

	accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :directions, reject_if: proc { |attributes| attributes['step'].blank? }, allow_destroy: true

	validates :title, :description, presence: true

	has_attached_file :image, styles: { :medium => "500x500#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end