//
//  Chapter3AnimalShelter.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

class Chapter3AnimalShelter {
    
    static func test() -> Bool {
        var q = ShelterQueue()
        q.enqueue(Animal(type: .cat, name: "Silly"))
        q.enqueue(Animal(type: .dog, name: "Henry"))
        q.enqueue(Animal(type: .dog, name: "Penny"))
        q.enqueue(Animal(type: .cat, name: "Peewee"))
        
        let c1 = q.dequeueDog()
        let c2 = q.dequeueCat()
        
        q.enqueue(Animal(type: .cat, name: "Catty"))
        q.enqueue(Animal(type: .dog, name: "Doggy"))
        
        print (c1!.name, c2!.name)
        
        let d1 = q.dequeueDog()!
        
        print (d1.name)
        
        return true
    }
    
}

struct ShelterQueue {

    var catQueue = Queue<ShelterEntry>()
    var dogQueue = Queue<ShelterEntry>()
    
    mutating func enqueue(_ entry: Animal) {
        
        let time = Int(mach_absolute_time())
        let node = Node(data: ShelterEntry(animal: entry, time: time))
        
        switch (entry.type) {
        case .cat: catQueue.add(node)
        case .dog: dogQueue.add(node)
        }
    }
    
    mutating func dequeueAny() -> Animal? {
        
        guard !catQueue.isEmpty && !dogQueue.isEmpty else {
            return catQueue.remove()?.animal ?? dogQueue.remove()?.animal
        }

        if let catTime = catQueue.peek()?.time,
           let dogTime = dogQueue.peek()?.time,
           catTime < dogTime {
            return catQueue.remove()?.animal
        } else {
            return dogQueue.remove()?.animal
        }
    }
    
    mutating func dequeueCat() -> Animal? {
        return catQueue.remove()?.animal
    }
    
    mutating func dequeueDog() -> Animal? {
        return dogQueue.remove()?.animal
    }
    
}

enum AnimalType {
    case cat, dog
}

struct Animal {
    var type: AnimalType
    var name: String
    var time: Int = Int(mach_absolute_time())
}

struct ShelterEntry {
    var animal: Animal
    var time: Int
}

extension Animal: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(name)
        hasher.combine(time)
    }
}

extension ShelterEntry: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(animal)
        hasher.combine(time)
    }
}

extension ShelterEntry: Equatable {
    static func == (lhs: ShelterEntry, rhs: ShelterEntry) -> Bool {
        return lhs.animal == rhs.animal && lhs.time == rhs.time
    }
}

extension ShelterEntry: Comparable {
    static func < (lhs: ShelterEntry, rhs: ShelterEntry) -> Bool {
        lhs.time < rhs.time
    }

    static func <= (lhs: ShelterEntry, rhs: ShelterEntry) -> Bool {
        lhs.time <= rhs.time
    }

    static func > (lhs: ShelterEntry, rhs: ShelterEntry) -> Bool {
        lhs.time > rhs.time
    }

    static func >= (lhs: ShelterEntry, rhs: ShelterEntry) -> Bool {
        lhs.time >= rhs.time
    }
}


