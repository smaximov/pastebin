A toy pastebin written in [Hanami](http://hanamirb.org/).

# API

This app provides RESTful API which can be used to create,
display, update or delete pastes via the `curl(1)` data transfer
tool.

To update or delete a paste, you also need to specify the access token
generated when the paste was created.

## Create

``` bash
$ curl -F 'content=<-' https://hanami-pastebin.herokuapp.com/api/pastes <<CONTENT
class Greeter
  def initialize(salutation: 'Hello')
    @salutation = salutation
  end

  def greet(who)
    puts "#{@salutation}, #{who}!"
  end
end
CONTENT
URL: https://hanami-pastebin.herokuapp.com/api/pastes/32
Access token: a4444f889d9dd4cb
```

## Show

``` bash
$ curl https://hanami-pastebin.herokuapp.com/api/pastes/32
class Greeter
  def initialize(salutation: 'Hello')
    @salutation = salutation
  end

  def greet(who)
    puts "#{@salutation}, #{who}!"
  end
end
```

## Update

``` bash
$ curl -X PATCH -F 'content=<-' -F 'access_token=a4444f889d9dd4cb' https://hanami-pastebin.herokuapp.com/api/pastes/32 <<CONTENT
puts 'Hello, World!'
CONTENT
```

## Delete

``` bash
$ curl -X DELETE -F 'access_token=a4444f889d9dd4cb' https://hanami-pastebin.herokuapp.com/api/pastes/32
```

## TODO

* [ ] Create JSON API.
* [ ] Provide web frontend.
