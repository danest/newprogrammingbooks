class BooksController < ApplicationController

  
  def index
    @books = Book.find(:all, :order => "id DESC")

  end
  
  def create
    session['fb_auth'] = request.env['omniauth.auth']
    session['fb_token'] = session['fb_auth']['credentials']['token']
    session['fb_error'] = nil
    cookies.permanent.signed[:remember_token] = "79ee2f56999b916cf5043a12e9cbcb98"
    redirect_to root_path
  end
  
  def destroy
    clear_session
    redirect_to root_path
  end
  
  def failure
    clear_session
    session['fb_error'] = 'In order to use this site you must allow us access to your Facebook data<br />'
    redirect_to root_path
  end
  
  def privacy
    
  end
  
  def terms
    
  end
  
  def clear_session
    session['fb_auth'] = nil
    session['fb_token'] = nil
    session['fb_error'] = nil
  end
  
end