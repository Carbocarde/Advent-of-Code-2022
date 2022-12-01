import heapq

if __name__ == "__main__":
    line = input("Paste input:")
    heap = []
    running_max = 0
    while True:
        if line == "e":  # Input end token
            heapq.heappush(heap, running_max)
            break
        elif line == "":
            heapq.heappush(heap, running_max)
            running_max = 0
        else:
            running_max += int(line)

        line = input()

    print("Max 1 sum: ", sum(heapq.nlargest(1, heap)))
    print("Max 3 sum: ", sum(heapq.nlargest(3, heap)))
