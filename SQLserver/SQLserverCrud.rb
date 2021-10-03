require 'tiny_tds'

class SQLserverCrud
  def initialize(user, pass, host, port, db)
    @client = TinyTds::Client.new(username: user, password: pass, host: host, port: port, database: db)
    @client.active?
  end

  def insertar(name, password)
    result = @client.execute("INSERT INTO usuarios(nombre, contraseña) VALUES(#{name}, #{password})")
    result.insert
  end

  def consultar_todo
    @client.execute("SELECT * FROM usuarios").each
  end

  def consultar_id(id)
    @client.execute("SELECT * FROM usuarios WHERE id = #{id}").each
  end

  def actualizar_contrasena(id, password)
    result = @client.execute("UPDATE usuarios SET contraseña = #{password} WHERE id = #{id}")
    result.do
  end

  def eliminar(id)
    result = @client.execute("DELETE FROM usuarios WHERE id = #{id}")
    result.do
  end
end
