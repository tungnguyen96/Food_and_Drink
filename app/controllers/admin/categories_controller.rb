module Admin
  class CategoriesController < BaseController
    
    def index
      @category = Category.all
    end

    def new; end

    def create; end

    def edit; end

    def update; end

    def destrou; end
  end
end
