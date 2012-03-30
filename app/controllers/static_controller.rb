class StaticController < ActionController::Base
    def show
        valid %w(static1 static2 static3)
        if valid.include?(params[:path])
            render :template => File.join('static', params[:path]
        else
            render :file => File.join(Rails.root, 'public', '404.html'), :status => 404
        end
    end
end