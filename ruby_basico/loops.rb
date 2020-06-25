#Repete a quandidade de vezes informando a quantidade na chamada do metodo times
5.times do |i|
  puts "Repetindo a mensagem com timer " + i.to_s + " vez(es)."
end

#while - executa enquanto condição for verdadeira

init = 0

while init <= 10
  puts "Repetindo a mensagem while " + init.to_s + " vez(es)."
  init += 1
end

#for

for item in (0...10)
  puts "Repetindo a mensagem for " + item.to_s + " vez(es)."
end

#foreach com Arrays

#array de strings
vingadores = ["IronMan", "Hulk", "SpiderMan", "Thor"]

puts vingadores.class

vingadores.each do |v|
  puts v
end
