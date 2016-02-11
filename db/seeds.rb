# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OutingState.create(name: "Proposed")
OutingState.create(name: "Imminent")
OutingState.create(name: "Underway")
OutingState.create(name: "Complete")
OutingState.create(name: "Canceled")
Office.create(name: "Boston-LCC", address: "2 Avenue de Lafayette, Boston, MA")
Office.create(name: "Santa Barbara-State", address: "419 State Street, Santa Barbara, CA")
Office.create(name: "Santa Barbara-Chapala", address: "614 Chapala Street, Santa Barbara, CA")
Office.create(name: "Santa Barbara-Mason", address: "25 E Mason Street, Santa Barbara, CA")
Office.create(name: "Santa Barbara-Salsipuedes", address: "415 N Salsipuedes Street, Santa Barbara, CA")
Office.create(name: "Seattle", address: "1501 E Madison Street, Seattle, WA")
User.new(name: "no one", office_id: Office.find_by(:name => "Boston-LCC").id, id: 9999, email: "noone@nowhere.com", password: "a3498flgweufbewfgweifb").save
Shop.create(name: "Falafel King", address: "48 Winter Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Beard Papa's", address: "31 Harrison Avenue, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "New Saigon Sandwich", address: "696 Washington Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Chicken and Rice Guys", address: "85 Bedford Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Pret A Manger", address: "101 Arch Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Back Deck", address: "2 West Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Boston Common Coffee Company", address: "10 High Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Saus", address: "33 Union Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Ho Yuen Bakery", address: "54 Beach Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Gracenote Coffee Boston", address: "108 Lincoln Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Gene's Chinese Flatbread Cafe", address: "86 Bedford Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Les Zygomates", address: "129 South Street, Boston, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Courtside", address: "291 Cambridge Street, Cambridge, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Similans", address: "145 First Street, Cambridge, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
Shop.create(name: "Cambridge Brewing Company", address: "One Kendall Square, 1 Kendall Square, Cambridge, MA", office_id: Office.find_by(:name => "Boston-LCC").id, user_id: User.find_by(:name => "no one").id)
