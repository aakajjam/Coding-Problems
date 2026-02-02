# This file is for LinkedLists
"""
class myNode():
    pointer = None
    def __init__(self, vegetable):
        self.vegetable = vegetable

head_node = myNode("Onion")
def add_new_end_node(veggie):
    current_node = head_node
    while current_node.pointer is not None:
        current_node = current_node.pointer
    # if current_node.pointer is None:
    current_node.pointer = myNode(veggie)

def list_all_nodes():
    current_node = head_node
    while current_node is not None:
        print(current_node.vegetable)
        current_node = current_node.pointer

def add_starting_node():
    starting_node = myNode("Cabbage")
    if starting_node.pointer is None:
        starting_node.pointer = head_node
    return starting_node
    #head_node = starting_node

#print(head_node.vegetable)

add_new_end_node("Lettuce")
add_new_end_node("Kale")
add_new_end_node("Beets")
list_all_nodes()
print("Added Nodes and Listed Successfully")
head_node = add_starting_node()
list_all_nodes()
print("Added New Head Node Successfully")

def delete_last_node():
    current_node = head_node
    while current_node.pointer.pointer is not None:
        current_node = current_node.pointer
    current_node.pointer = None


def add_new_node_middle(veggie):
    # Reference the first node for traversing purposes
    current_node = head_node

    # Traverse until desired vegetable called veggie
    while current_node.vegetable != veggie:
        # Move to the next node
        current_node = current_node.pointer

    # Create a new node
    added_node = myNode("Radish")

    # Save the pointer of the desired veggie
    saved_pointer = current_node.pointer

    # Link new node with saved pointer
    added_node.pointer = saved_pointer

    # Link current node to the new node
    current_node.pointer = added_node


add_new_node_middle("Onion")
list_all_nodes()
print("**Added a new node Radish in the middle")

def del_middle_node(veggie):

    # Reference the first node for traversing purposes
    current_node = head_node

    # Traverse the linkedlist until we get to vegetable we want removed
    while current_node.pointer.vegetable != veggie:

        # Move on to the next node
        current_node = current_node.pointer

    # Save pointer in desired vegetable
    saved = current_node.pointer.pointer

    # Delete desired vegetable by setting pointer to None
    current_node.pointer.pointer = None

    # Link the current node with the node following the deleted vegetable
    current_node.pointer = saved

delete_last_node()
list_all_nodes()
print("Deleted Last Node Successfully")
print("##################################")

del_middle_node("Lettuce")
list_all_nodes()
"""

class myNode():
    def __init__(self, number):
        self.number = number
    pointer = None

head_node = myNode(10)
def add_new_end_node(number):
    current_node = head_node
    while current_node.pointer is not None:
        current_node = current_node.pointer
    current_node.pointer = myNode(number)

# Head node created with value of 10
add_new_end_node(20)
add_new_end_node(30)
add_new_end_node(40)
add_new_end_node(50)

def list_all_nodes():
    current_node = head_node
    while current_node is not None:
        print(current_node.number)
        current_node = current_node.pointer

#list_all_nodes()

def get_linked_list_length(head_node):
    length = 0
    current_node = head_node
    while current_node is not None:
        current_node = current_node.pointer
        length = length + 1
    return length

def get_middle_node(head_node):

    current_node = head_node

    length = get_linked_list_length(head_node)

    if length % 2 == 1:
        middle_value = (length // 2) + 1
    else:
        middle_value = (length // 2) + 1

    length = 1

    while (current_node is not None) and (length != middle_value):
        length = length + 1
        current_node = current_node.pointer

    print(current_node.number)

#get_middle_node(head_node)

def reverse_linked_list():
    current_node = head_node
    length = get_linked_list_length(head_node)

    while current_node is not None:
        current_node = current_node.pointer
    saved_last_node = current_node

    length = length - 1 # 4

    while current_node is not None and length != 0:
        index = 0
        current_node = current_node.pointer
        index += 1
        if index == length:
            saved_last_node.pointer = current_node
            length = length - 1 # This is now 3

    while current_node is not None and length != 0:
        index = 0
        if index != length:
            current_node = current_node.pointer
            index += 1
        else:
            current_node.pointer = add_new_end_node(current_node)
            length = length - 1


reverse_linked_list()


