// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
//= require jquery
//= require rails-ujs
//= require_tree .

import { Turbo } from "@hotwired/turbo-rails"
import Rails from "@rails/ujs";

Rails.start()
Turbo.start()
