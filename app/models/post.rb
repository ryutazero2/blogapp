# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  validates :title,
            presence: { message: 'を入力してください' }

  validates :content,
            presence: { message: 'を入力してください' }

  validates :user_id, presence: true
end
