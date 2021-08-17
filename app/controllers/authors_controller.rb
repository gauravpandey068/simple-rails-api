class AuthorsController < ApplicationController

    #show all data
    def index
        authors = Author.all
        render json: authors
    end

    #show particular data
    def show
        author = Author.find_by(id: params[:id])
        render json: author
    end

    def create
        author = Author.create!(name: params[:name], bio: params[:bio])
        render json: {message: 'Successfuly Created' ,author: author}
    end

    def update
        author = Author.find(params[:id])
        author.update!(name: params[:name], bio: params[:bio] )
        render json: {message: 'Successfuly Updated!', author: author}
        rescue StandardError => e
            render json: {message: 'Cannot Update'}
        
    end

    def destroy
        author = Author.find_by(id: params[:id])

        if author.present?
            author.destroy
            render json: { message: 'Successfuly Delete' }
        else
            render json: { message: 'Cannot Delete'}
        end
    end

end
