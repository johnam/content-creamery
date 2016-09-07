class Article < ActiveRecord::Base
  include FriendlyId
  friendly_id :slug_candidates, use: :slugged

  scope :published_on_homepage, -> { where(published_on_homepage: true) }

  validates_presence_of :title, :url, :slug
  validates_uniqueness_of :url, :title, :slug

  mount_uploader :image, ArticleImageUploader

  before_validation :set_published_if_on_homepage
  before_save :process_image_attribution

  def draft?
    !self.published
  end

  def summarized?
    self.summary.present?
  end

  def preview_key
    ingredients = "#{self.slug}-#{ENV['PREVIEW_KEY_SALT']}-#{Time.now.utc.to_date.to_s}"
    Digest::MD5.hexdigest(ingredients)
  end

  private

  def set_published_if_on_homepage
    if self.published_on_homepage == true
      self.published = true
    end

    true
  end

  def process_image_attribution
    if self.image_attribution.present?
      if matches = self.image_attribution.match(/&quot.*\w<\/a>/)
        attribution = matches[0]
        attribution.slice!(/<a href='https:\/\/www.flickr.com\/people\/.*&nbsp;<\/a>/)

        self.image_attribution = attribution
      end
    end

    true
  end

  def slug_candidates
    [:title, [:publication, :title], [:publication, :author, :title]]
  end
end
