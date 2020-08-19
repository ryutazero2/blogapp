# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  validates :name,
            presence: { message: 'を入力してください' },
            uniqueness: true,
            format: { with: /\A[-_a-z0-9]+\z/i, message: 'に使用不可能な記号が含まれています', allow_blank: true },
            length: { maximum: 20, message: 'は20文字以下にしてください' }

  validates :password,
            length: { minimum: 8, allow_blank: true }, on: :create

  validates :display_name,
            length: { maximum: 30 }

  validates :profile,
            length: { maximum: 150 }
end
