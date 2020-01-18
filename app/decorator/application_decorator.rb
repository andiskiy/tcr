# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  def display_created_at
    h.l(created_at, format: :long)
  end
end
