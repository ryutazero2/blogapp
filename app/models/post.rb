# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :title,
            presence: { message: 'を入力してください' },
            length: { maximum: 512, message: 'は512文字以下にしてください' }

  validates :content,
            presence: { message: 'を入力してください' }

  validates :user_id, presence: true
end
