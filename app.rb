require 'sinatra'

get '/' do
  @now = Time.now.strftime("I was first rendered on %D at %I:%M:%S%p %Z (UTC %z)")
  erb "index.html".to_sym
end
