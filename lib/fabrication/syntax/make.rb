module Fabrication
  module Syntax

    # Extends Fabrication to provide make/make! class methods, which are
    # shortcuts for Fabricate.build/Fabricate.
    #
    # Usage:
    #
    # require 'fabrication/syntax/make'
    #
    # User.make(:name => 'Johnny')
    #
    #
    module Make

      def make(overrides = {}, &block)
        Fabrication::Fabricator.generate(name.underscore.to_sym,
                                         {:save => false}, overrides,
                                         &block)
      end

      def make!(overrides = {}, &block)
        Fabrication::Fabricator.generate(name.underscore.to_sym,
                                         {:save => true}, overrides,
                                         &block)
      end

    end
  end
end

Object.extend Fabrication::Syntax::Make
