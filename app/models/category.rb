class Category < ApplicationRecord
    validates :name ,presence: true,length: {minimum:3, maximum:25}
    validates_uniqueness_of :name, on: :create, message: "must be unique"
end