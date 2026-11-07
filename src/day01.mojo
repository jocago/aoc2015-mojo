

def part1(input: String) raises -> Int:
    var floor: Int = 0
    for char in input:
        if char == "(":
            floor += 1
        elif char == ")":
            floor -= 1
        else:
            raise "Char must be ( or )"
    return floor

def part2(input: String) raises -> Int:
    var floor: Int = 0
    var char_num: Int = 1
    for char in input:
        if char == "(":
            floor += 1
        elif char == ")":
            floor -= 1
        else:
            raise "Char must be ( or )"
        if floor == -1:
            return char_num
        char_num += 1
    return floor



def solve() raises -> String:
    var output: String
    var input: String
    with open("input/day01.txt", "r") as f:
        input = f.read()
    output = String(part2(input))

    return output