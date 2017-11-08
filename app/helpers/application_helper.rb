module ApplicationHelper
  def nav_link(link_text, link_path)
    content_tag(:li) do
      if current_page?(link_path)
        link_to link_text, link_path, :class => 'active nav-link'
      else
        link_to link_text, link_path, :class => 'nav-link'
      end
    end
  end
end
