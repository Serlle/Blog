namespace :ejemplo2 do
  desc "Imprime en consola task1"

  task task1: :environment do
    puts "task1"
  end

#Concatenando tareas
  desc "Ejecuta la tarea task1 e imprime en consola task2"

  task :task2 => :task1 do
    puts "task2"
  end


#Si debemos ejecutar tareas que se encuentran en un namespace diferente simplemente lo indicamos mediante un string.
  desc "Ejecuta task1, task2 e imprime en consola task3"

  task :task3 => 'ejemplo_tarea:say_hello' do
    puts "task3"
  end

#Pasando argumentos
  desc "Imprime en consola el valor del nombre "

  task :task4, [:first_name, :last_name] do |t, args|
    puts "Hola #{args.first_name} #{args.last_name}"
  end


end
