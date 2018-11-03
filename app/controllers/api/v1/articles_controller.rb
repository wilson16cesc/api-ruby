module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded articles', data:articles},status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: {status: 'SUCCESS', message:'cargaron un articulos', data:article},status: :ok
      end

      def create
        article = Article.new(article_params)
        if(article.save)
          render json: {status: 'SUCCESS', message:'articulo guardado', data:article},status: :ok
        else
          render json: {status: 'SUCCESS', message:'articulo no guardado', data:article},status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {status: 'SUCCESS', message:'Boom! volo!', data:article},status: :ok
      end

      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: {status: 'SUCCESS', message:'registro actualizado', data:article},status: :ok
        else
          render json: {status: 'SUCCESS', message:'no actualizo', data:article.error},status: :unprocessable_entity
        end
      end

      private

   def article_params
     params.permit(:title, :content)
   end

    end
  end
end
