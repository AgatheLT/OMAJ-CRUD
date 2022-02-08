puts "Database en cours de nettoyage..."
Category.destroy_all

puts "Quelques catégories en cours de création..."
veste = { name: "Veste" }
pantalon = { name: "Pantalon" }
top = { name: "Top" }

[ veste, pantalon, top ].each do |attributes|
  category = Category.create!(attributes)
  puts "Création de #{category.name}"
end
puts "C'est fait !"
