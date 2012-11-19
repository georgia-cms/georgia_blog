module Kennedy
  class Comment < ActiveRecord::Base

    paginates_per 20

    attr_accessible :template, :slug, :published_at, :published_by_id

    belongs_to :post

    has_many :contents, as: :contentable, dependent: :destroy
    accepts_nested_attributes_for :contents
    attr_accessible :contents_attributes

    belongs_to :status, class_name: Georgia::Status
    delegate :published?, :draft?, :pending_review?, to: :status

    include PgSearch
    pg_search_scope :text_search, using: {tsearch: {dictionary: 'english', prefix: true, any_word: true}},
    associated_against: { contents: [:title, :text, :excerpt, :keywords, :slug] }

    default_scope includes(:contents)
    scope :published, joins(:status).where('georgia_statuses' => {name: Georgia::Status::PUBLISHED})

    def self.search query
      query.present? ? text_search(query) : scoped
    end

    def wait_for_review
      self.status = Georgia::Status.pending_review.first
      self
    end

    def publish(user)
      self.published_by = user
      self.status = Georgia::Status.published.first
      self.create_revision!
      self.current_revision = self.last_revision
      self
    end

    def unpublish
      self.published_by = nil
      self.current_revision = nil
      self.status = Georgia::Status.draft.first
      self
    end

    def load_current_revision!
      return self if self.current_revision.blank? or self.current_revision == self.last_revision
      self.class.new().load_raw_attributes! self.current_revision.revision_attributes.symbolize_keys!
    end

    def preview! attributes
      self.load_raw_attributes! attributes
    end

    before_save do
      self.status ||= Georgia::Status.draft.first
    end

    protected

    def load_raw_attributes! attributes
      attributes.delete(:contents).each do |content|
        self.contents << Georgia::Content.new(content, without_protection: true)
      end
      self.assign_attributes(attributes, without_protection: true)
      self
    end

  end
end