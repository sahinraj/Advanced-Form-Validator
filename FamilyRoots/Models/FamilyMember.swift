import Foundation
import SwiftData

struct FamilyMember: Identifiable, Hashable {
    let id: UUID
    let name: String
    let relationship: String
    let initials: String
    var children: [FamilyMember]

    init(
        id: UUID = UUID(),
        name: String,
        relationship: String,
        initials: String,
        children: [FamilyMember]
    ) {
        self.id = id
        self.name = name
        self.relationship = relationship
        self.initials = initials
        self.children = children
    }
}

@Model
final class PersistedFamilyMember {
    var id: UUID
    var name: String
    var relationship: String
    var initials: String

    init(id: UUID = UUID(), name: String, relationship: String, initials: String) {
        self.id = id
        self.name = name
        self.relationship = relationship
        self.initials = initials
    }
}

extension FamilyMember {
    static let sampleTree = FamilyMember(
        name: "John Doe",
        relationship: "Grandfather",
        initials: "JD",
        children: [
            FamilyMember(
                name: "Robert Doe",
                relationship: "Father",
                initials: "RD",
                children: [
                    FamilyMember(
                        name: "Sam Doe",
                        relationship: "Son",
                        initials: "SD",
                        children: []
                    ),
                    FamilyMember(
                        name: "Sara Doe",
                        relationship: "Daughter",
                        initials: "SD",
                        children: []
                    )
                ]
            ),
            FamilyMember(
                name: "Emily Doe",
                relationship: "Aunt",
                initials: "ED",
                children: []
            )
        ]
    )
}
