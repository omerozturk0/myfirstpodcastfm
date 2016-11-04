class Episode < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :podcast

  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }, default_url: ActionController::Base.helpers.asset_path("noimg.png")
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\z/

  has_attached_file :mp3
  validates_attachment_content_type :mp3, content_type: ["audio/mpeg", "audio/mp3"], file_name: { matches: [/mp3\Z/] }
end
