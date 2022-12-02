import java.io.File

enum class RPS(val value: Int) {
    ROCK(1),
    PAPER(2),
    SCISSORS(3),
}

fun partA() {
    var score = 0

    File("day2/input.txt").forEachLine {
        val split = it.split(" ")
        val opp = when (split[0]) {
            "A" -> RPS.ROCK
            "B" -> RPS.PAPER
            "C" -> RPS.SCISSORS
            else -> throw IllegalArgumentException("Encountered unexpected opponent move")
        }
        val you = when (split[1]) {
            "X" -> RPS.ROCK
            "Y" -> RPS.PAPER
            "Z" -> RPS.SCISSORS
            else -> throw IllegalArgumentException("Encountered unexpected user move")
        }

        score += you.value

        val delta = (you.value - opp.value + 3) % 3

        score += when (delta) {
            0 -> 3 // Tie
            1 -> 6 // Win
            2 -> 0 // Lose
            else -> throw IllegalArgumentException("Encountered unexpected delta value")
        }
    }

    println("Part A Score: $score")
}

enum class MOVE(val score: Int) {
    WIN(6),
    DRAW(3),
    LOSE(0),
}

fun partB() {
    var score = 0

    File("day2/input.txt").forEachLine {
        val split = it.split(" ")
        val opp = when (split[0]) {
            "A" -> RPS.ROCK
            "B" -> RPS.PAPER
            "C" -> RPS.SCISSORS
            else -> throw IllegalArgumentException("Encountered unexpected opponent move")
        }
        val move = when (split[1]) {
            "X" -> MOVE.LOSE
            "Y" -> MOVE.DRAW
            "Z" -> MOVE.WIN
            else -> throw IllegalArgumentException("Encountered unexpected user move")
        }

        score += move.score

        score += when (move) {
            MOVE.LOSE -> (opp.value + 1) % 3 + 1  // opp + 2
            MOVE.DRAW -> opp.value                // opp
            MOVE.WIN -> opp.value % 3 + 1         // opp + 1
        }
    }

    println("Part B Score: $score")
}

fun main() {
    partA() // 13221
    partB() // 13131
}
