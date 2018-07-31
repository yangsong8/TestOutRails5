module DefaultPageContent
  extend ActiveSupport::Concern
  included do
    before_action :set_page_defaults
  end
  def set_page_defaults
    @page_title = "TestOutRails5"
    @seo_keywords = "Yang Song Rails5"
  end
end