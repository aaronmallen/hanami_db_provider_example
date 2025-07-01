# frozen_string_literal: true

module Test
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.

    slice :parent, at: "/parent" do
    end
  end
end
