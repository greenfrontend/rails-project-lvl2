# frozen_string_literal: true

module PostCommentsHelper
  def nested_comments(comments)
    safe_join(comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), class: 'nested_comments')
    end)
  end
end
