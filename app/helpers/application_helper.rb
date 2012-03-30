module ApplicationHelper
    def title
        base_title = t(:pniyot_taktsiviot)
        if @title.nil?
            base_title
        else
            "#{base_title} | #{@title}"
        end
    end
end
