require 'mongo'

class MongoDB
  def initialize(user, pass, db, cluster)
    @cluster = cluster
    @client = Mongo::Client.new("mongodb+srv://#{user}:#{pass}@#{cluster}/#{db}?retryWrites=true&w=majority")
  end

  def info
    puts 'Info'
    13.times {print '-'}
    puts ''
    puts "Conectado: #{@client.cluster.connected?}\nDBs: #{@client.database_names}\nCluster: #{@cluster}"
  end

  def insertar(documento, coleccion)
    coleccion = @client[coleccion.to_sym]

    res = coleccion.insert_one(documento)
    puts "Se registro #{res.n} documento."
    puts "Id del documento: #{res.inserted_id}"
  end

  def consultar_documentos(coleccion)
    coleccion = @client[coleccion.to_sym]

    coleccion.find.each {|documentos| puts documentos}
  end

  # TODO: Eliminar documentos.
  def eliminar_documento(coleccion, id)
    coleccion = @client[coleccion.to_sym]

    coleccion.delete_one({:message => "#{id}"})
  end
end
