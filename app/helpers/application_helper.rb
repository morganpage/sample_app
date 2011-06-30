module ApplicationHelper
  # Return a title on a per-page basis
  def title #method definition
    base_title = "Morgan Page's Web Portal"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
