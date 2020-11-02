require 'net/http'

When('I send a GET request to posts') do
   get(('https://localhost:3000' + '/posts/'))
end