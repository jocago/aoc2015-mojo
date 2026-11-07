

def lowest_n(values: List[Int], n: Int) -> List[Int]:
    var result = List[Int]()

    if n <= 0:
        return result^

    for value in values:
        var inserted = False

        for i in range(len(result)):
            if value < result[i]:
                result.insert(i, value)
                inserted = True
                break

        if not inserted and len(result) < n:
            result.append(value)

        if len(result) > n:
            _ = result.pop()

    return result^