class BookmarksController < ApplicationController
  # '/lists/new'
  def new
    # this instance variable is JUST for the form
    @bookmark = Bookmark.new
  end
  # we cant access from a URL. The form is sending the data here (/lists)
  # THIS DOES NOT HAVE A VIEW
  def create
    # we need to create our instance with our STRONG params
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(@list)
    else
      # show the form with the lists that didnt save (not a brand new one)
      render 'new', status: :unprocessable_entity
    end
  end
end
