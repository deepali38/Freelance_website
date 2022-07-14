// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "direct_uploads"

$(document).ready(function(){
  setTimeout(function(){
    $('.notification').remove();
  }, 5000);
 })

