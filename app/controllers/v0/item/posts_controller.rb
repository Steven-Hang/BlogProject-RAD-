module V0
    module Item
        class PostsController < ApplicationController
            before_action :set_post
            
            def index
             posts = Post.order('created_at DESC')
             render json: {status: 'SUCCESS', message:'Loaded News Posts', data:posts}, status: :ok
         end
             
            
            def show
             render json: {
                 by: @location.user.username,
                 id: @location.id,
                 title: @location.title,
                 time: @location.created_at.to_s,
                 url: @location.source
             } 
         end
         
             def create 
             post = Post.new(post_params)
             
              if post.save
                 render json: {status: 'SUCCESS', message:'Saved post', data:post},status: :ok
             else
                 render json: {status: 'ERROR', message:'post not saved', data:post.errors},status: :unprocessable_entity
                end
            end
      
            private
            
            def set_post
                @location = Post.find(params[:id])
            end
 
            def post_params
            params.permit(:title, :source, :user_id, :comments)
            end
        end
    end
end

 