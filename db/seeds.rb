# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


states = [
  { name: "Rondônia", uf: "RO" },
  { name: "Acre", uf: "AC" },
  { name: "Amazonas", uf: "AM" },
  { name: "Roraima", uf: "RR" },
  { name: "Pará", uf: "PA" },
  { name: "Amapá", uf: "AP" },
  { name: "Tocantins", uf: "TO" },
  { name: "Maranhão", uf: "MA" },
  { name: "Piauí", uf: "PI" },
  { name: "Ceará", uf: "CE" },
  { name: "Rio Grande do Norte", uf: "RN" },
  { name: "Paraíba", uf: "PB" },
  { name: "Pernambuco", uf: "PE" },
  { name: "Alagoas", uf: "AL" },
  { name: "Sergipe", uf: "SE" },
  { name: "Bahia", uf: "BA" },
  { name: "Minas Gerais", uf: "MG" },
  { name: "Espírito Santo", uf: "ES" },
  { name: "Rio de Janeiro", uf: "RJ" },
  { name: "São Paulo", uf: "SP" },
  { name: "Paraná", uf: "PR" },
  { name: "Santa Catarina", uf: "SC" },
  { name: "Rio Grande do Sul", uf: "RS" },
  { name: "Mato Grosso do Sul", uf: "MS" },
  { name: "Mato Grosso", uf: "MT" },
  { name: "Goiás", uf: "GO" }, 
  { name: "Distrito Federal", uf: "DF" }
]

states.each do |state|
  State.create(name: state[:name], code: state[:uf] )
end
puts "[seed:db] Seed process was completed!"