require 'kaminari/rectify/query/version'
require 'forwardable'
require 'active_support/concern'

module Kaminari
  module Rectify
    module Query
      KAMINARI_ACTIVERECORD_RELATION_METHODS = %i(
        entry_name
        reset
        total_count
        without_count
        load
        last_page?
        out_of_range?
        total_count
        limit_value
      ).freeze

      KAMINARI_PAGE_SCOPE_METHODS = %i(
        per
        max_paginates_per
        padding
        total_pages
        current_page
        current_per_page
        next_page
        prev_page
        first_page?
        last_page?
        out_of_range?
      ).freeze

      extend ActiveSupport::Concern

      included do
        extend Forwardable
        delegate KAMINARI_ACTIVERECORD_RELATION_METHODS => 'cached_query'
        delegate KAMINARI_PAGE_SCOPE_METHODS => 'cached_query'
        delegate Kaminari.config.page_method_name => 'cached_query'
      end
    end
  end
end

Rectify::Query.include Kaminari::Rectify::Query
