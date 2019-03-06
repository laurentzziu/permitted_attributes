# frozen_string_literal: true

class Post
  include PermittedAttributes

  def self.column_names
    %w[id title category_id creator_id created_at updated_at]
  end
end
