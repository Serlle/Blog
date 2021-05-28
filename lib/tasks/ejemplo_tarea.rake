namespace :ejemplo_tarea do
  desc "Se debe imprimir en consola el mensaje: Hola Mundo"
  
  task say_hello: :environment do
    p "Hola Mundo"
  end

end
