require 'redis'

class RedisCrud
  def initialize(user, password, host, port)
    @client = Redis.new(host: host, port: port, username: user, password: password)
    @client.ping
  end

  def informacion_servidor
    info = @client.info

    version = info['redis_version']
    os = info['os']
    role = info['role']

    puts "Conectado"
    13.times {print "-"}
    print "\nRedis Version: #{version}\nOS: #{os}\nDB Role: #{role}\n"
  end

  def insertar(key, value)
    puts @client.set(key, value)
  end

  def consultar_llaves
    puts 'Keys'
    13.times {print "-"}
    puts ""
    puts @client.keys('*')
  end

  def consultar_valor(key)
    puts @client.get(key)
  end

  def eliminar_llave(key)
    puts @client.del(key)
  end
end




