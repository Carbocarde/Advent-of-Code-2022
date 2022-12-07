import heapq

if __name__ == "__main__":
    lines = open("input.txt", "r").read().split('\n')
    it = iter(lines)

    heap = []
    running_max = 0
    line = next(it, None)
    while line is not None:  # Has next
        if line == '':
            heapq.heappush(heap, running_max)
            running_max = 0
        else:
            running_max += int(line)

        line = next(it, None)

    print(f"Part 1: {sum(heapq.nlargest(1, heap))}")
    print(f"Part 2: {sum(heapq.nlargest(3, heap))}")
