BOOLEAN_USER_PREFERENCES = {
    user1: [:item1, :item2, :item3],
    user2: [:item2, :item3, :item4],
    user3: [:item1, :item5]
}

USER_PREFERENCES = {
    user1: { item1: 2.5, item2: 5.0, item3: 1.0 },
    user2: { item2: 3.0, item3: 1.5, item4: 1.0 },
    user3: { item1: 3.0, item3: 2.0, item5: 1.0 }
}

BOOLEAN_ITEM_PREFERENCES = {
    item1: [:user1, :user3],
    item2: [:user1, :user2],
    item3: [:user1, :user2],
    item4: [:user1],
    item5: [:user3]
}