/*
 `Human` Bob has 1000 `Pets` of random names. Optimize the following code snippet to allow Bob to print all of his pets' names in a comma-separated String using .petNames
 
 */

class Pet {
    let name: String
    var owner: Human?
    init(name: String){
        self.name = name
    }
}

class Human {
    var name: String
    var pets: [Pet] = []
    
    lazy var petNames: () -> String = {
        var petName = [String]()
        for pet in self.pets{
            petName.append(pet.name)
        }
        return petName.joined(separator: ",")
    }
    
    init(name: String){
        self.name = name
    }
    
    func adopt(pet: Pet){
        pets.append(pet)
        pet.owner = self
    }
}

let aHuman = Human(name: "Prajwal")
aHuman.adopt(pet: Pet(name: "Tommy"))
aHuman.adopt(pet: Pet(name: "Bommy"))
aHuman.adopt(pet: Pet(name: "Dummy"))
aHuman.adopt(pet: Pet(name: "Kummy"))

aHuman.petNames()

