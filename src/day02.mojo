from utils import lowest_n

struct Box(Copyable):
    var l: Int
    var w: Int
    var h: Int

    def __init__(out self, dims: String) raises:
        var dims_l =  dims.split("x")
        self.l = Int(dims_l[0])
        self.w = Int(dims_l[1])
        self.h = Int(dims_l[2])
        

    def get_surface_area(self) -> Int:
        return 2 * self.l * self.w + 2 * self.w * self.h + 2 * self.h * self.l

    def get_extra_paper(self) -> Int:
        var sides: List[Int] = [
            self.l * self.w,
            self.l * self.h,
            self.w * self.h
        ]
        return min(sides[0], min(sides[1], sides[2]))

    def get_cubic_volume(self) -> Int:
        return self.l * self.w * self.h

    def get_ribbon_length(self) -> Int:
        var dims: List[Int] = [self.l, self.w, self.h]
        var lowest_two: List[Int] = lowest_n(dims, 2)
        return (lowest_two[0] * 2) + (lowest_two[1] * 2)

def parse_to_boxes(input: String) raises -> List[Box]:
    var boxes: List[Box] = []
    for line in input.split("\n"):
        boxes.append(Box(String(line)))
    return boxes^


def part1(input: String) raises -> Int:
    var total_paper: Int = 0
    for box in parse_to_boxes(input):
        total_paper += box.get_surface_area() + box.get_extra_paper()
    return total_paper

def part2(input: String) raises -> Int:
    var total_ribbon: Int = 0
    for box in parse_to_boxes(input):
        total_ribbon += box.get_cubic_volume() + box.get_ribbon_length()
    return total_ribbon


def solve() raises -> String:
    # Config Run
    comptime day_name: String = "day02"
    comptime use_example: Bool = False
    comptime part: Int = 2

    # Execute
    var input: String
    var input_path: String
    comptime if use_example:
        input_path = String(t"input/{day_name}-example.txt")
    else:
        input_path = String(t"input/{day_name}.txt")
    with open(String(input_path), "r") as f:
        input = f.read()
    print(t"AoC: {day_name} - Part {part}")
    comptime if part == 1:
        return String(part1(input))
    else:
        return String(part2(input))