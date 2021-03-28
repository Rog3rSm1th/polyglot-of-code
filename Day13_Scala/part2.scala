object Day13_Part2
{
    def main(args: Array[String])  
    { 
        // Read input
        val LINES = io.Source.fromFile("input.txt").getLines

        // Extract value from line
        val LINE_REGEX = raw"(.+) would (lose|gain) ([0-9]+) happiness units by sitting next to (.+).".r
        val happiness_changes = LINES.map { case LINE_REGEX(a, sign, change, b) =>
            val gain = (if (sign == "lose") -1 else 1)
            (a, b) -> change.toInt * gain
        }.toMap

        // Find all the seating arrangement
        val seating_arrangements =  happiness_changes.keys.flatMap {
            case (a, b) => Seq(a, b)
        }.toVector.permutations.map { path =>
            val costs = (path :+ path.head).sliding(2).map { case Seq(a, b) =>
                 happiness_changes(a, b) +  happiness_changes(b, a)
            }.toVector

            costs.sum - costs.min
        }

        // Optimal seating arrangement
        println(seating_arrangements.max)
    }
}

