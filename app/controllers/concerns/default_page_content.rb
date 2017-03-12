# frozen_string_literal: true
# Defaults used in layouts
module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Christopher Brenner Portfolio'
    @seo_keywords = 'Christopher Brenner portfolio'
  end
end
