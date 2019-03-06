# frozen_string_literal: true

RSpec.describe PermittedAttributes do
  DEFAULT_EXCLUDED_ATTRIBUTES = %i[id created_at updated_at].freeze

  describe 'included' do
    describe 'respond_to?' do
      it { expect(Post).to respond_to(:permitted_attributes) }
      it { expect(Post).to respond_to(:excluded_attributes) }
    end

    describe '#permitted_attributes' do
      it 'should return all, but default excluded, when no options are provided' do
        expect(Post.permitted_attributes).to eq(Post.column_names.map(&:to_sym) - DEFAULT_EXCLUDED_ATTRIBUTES)
      end

      it 'should return all, but default excluded, when `skip_defaults: false`' do
        Post.excluded_attributes(skip_defaults: false)
        expect(Post.permitted_attributes).to eq(Post.column_names.map(&:to_sym) - DEFAULT_EXCLUDED_ATTRIBUTES)
      end

      it 'should return all attributes when `skip_defaults: true`' do
        Post.excluded_attributes(skip_defaults: true)
        expect(Post.permitted_attributes).to eq(Post.column_names.map(&:to_sym))
      end

      it 'should return all the other attributes when excluding an attributes' do
        Post.excluded_attributes(:title, skip_defaults: false)
        expect(Post.permitted_attributes).to eq(Post.column_names.map(&:to_sym) - DEFAULT_EXCLUDED_ATTRIBUTES - %i[title])
      end

      it 'should return all the other attributes when excluding an attributes' do
        Post.excluded_attributes(:title, skip_defaults: true)
        expect(Post.permitted_attributes).to eq(Post.column_names.map(&:to_sym) - %i[title])
      end
    end
  end
end
