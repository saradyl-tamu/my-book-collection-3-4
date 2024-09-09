class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = 'Book was successfully created.'
            redirect_to @book
        else
            flash.now[:alert] = @book.errors.full_messages.to_sentence
            render :new
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to books_path
        else
        render :edit
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def confirm_delete
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "Book was successfully deleted."
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :price, :published_date)
    end
end
