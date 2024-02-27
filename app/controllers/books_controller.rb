class BooksController < ApplicationController
  
  def create
    	@book = Book.new(book_params)
        if @book.save
       	redirect_to book_path(@book.id)
  	    else
        @books = Book.all.order(id: "ASC")
	    	render'books/index'
  	    end
  end
  
  def show
    @book = Book.find(params[:id])  
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all

    if params[:id].present?
      set_book
    else
      @book = Book.new
    end
  end

 def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to request.referer, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end