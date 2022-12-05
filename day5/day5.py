from typing import List, Tuple, Iterator


def parse_stacks(file: str) -> Tuple[List[List[str]], Iterator[str]]:
    """
    Parses stack into 2d representation.
    :param file: Input file.
    :return: 2d representation, iterator for move commands.
    """
    crates = []
    lines = file.split('\n')
    it = iter(lines)

    line = next(it)
    while line.strip()[0] == '[':
        offset = 0
        while '[' in line:
            offset += line.index('[') + 1
            line = line[line.index('[') + 1:]
            while len(crates) <= offset // 4:
                crates.append([])
            crates[offset // 4].append(line[0])
        line = next(it)

    # Ignore column labels and proceed to the instructions
    next(it)

    return crates, it


def solve_problem(file: str, part=1):
    crates, it = parse_stacks(file)

    line = next(it)
    while line != '':
        count, src, dest = int(line.split()[1]), int(line.split()[3]), int(line.split()[5])

        # Convert to indices
        src, dest = src - 1, dest - 1

        # Select source material
        selection = crates[src][:count]

        # Error checking
        if len(selection) < count:
            print(line)
            raise ValueError("Can't select enough crates!")

        # If needed, simulate picking them up one at a time
        if part == 1:
            selection.reverse()

        # Remove source material
        crates[src] = crates[src][count:]

        # Move source material
        crates[dest] = selection + crates[dest]

        line = next(it)

    # Get top crate from each stack
    print(f"Part {part}: {''.join([col[0] for col in crates])}")


if __name__ == "__main__":
    f = open("input.txt", "r").read()
    solve_problem(f, part=1)
    solve_problem(f, part=2)
