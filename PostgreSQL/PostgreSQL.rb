require 'pg'

class PostgerSQL
  def initialize(db, user, pass, host, port)
    @conn = PG.connect(:dbname => db, :host => host, :port => port, :user => user, :password => pass)
  end

  def insertar(name, pass)
    puts @conn.exec("INSERT INTO usuarios(nombre, pass) VALUES(#{name}, #{pass})")
  end

  def consultar_todo
    res = @conn.exec("SELECT * FROM usuarios")

    puts "Resultados"
    13.times {print '-'}
    puts ""

    res.each {|row| puts row}
  end

  def consultar_id(id)
    res = @conn.exec("SELECT * FROM usuarios WHERE id = #{id}")

    puts "Resultados"
    13.times {print '-'}
    puts ""

    res.each {|row| puts row}
  end

  def actualizar_contrasena(id, password)
    @conn.exec("UPDATE usuarios SET pass = #{password} WHERE id = #{id}")
  end

  def eliminar(id)
    @conn.exec("DELETE FROM usuarios WHERE id = #{id}")
  end
end
