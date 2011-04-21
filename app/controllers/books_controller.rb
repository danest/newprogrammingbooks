require 'omniauth/oauth'

class BooksController < ApplicationController

  
  def index
    @books = Book.find(:all, :order => "id DESC")
  end
  
  def create
    session['fb_auth'] = request.env['omniauth.auth']
    session['fb_token'] = session['fb_auth']['credentials']['token']
    session['fb_error'] = nil
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
  
  def clear_session
    session['fb_auth'] = nil
    session['fb_token'] = nil
    session['fb_error'] = nil
  end
  
end