class Student < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_one :manager, dependent: :destroy

  validates :name, presence: {message: "名前がありません"}
  validates :student_id, length: {is: 8, message: "字数が足りません"} ,presence: {message: "IDがありません"}
end
