class Day11Part1(var password: String) {

    // Passwords may not contain the letters i, o, or l
    private val REGEX_IOL = """[iol]""".toRegex()
    // Passwords must contain at least two different, non-overlapping pairs of letters
    private val REGEX_PAIRS = """(.)\1.*(.)\2""".toRegex()

    // Increment the String
    // increment('aa') -> 'ab'
    private fun increment(password: String): String {
        val passwordArray = password.toCharArray()
        var firstIndex = passwordArray.lastIndex

        while (passwordArray[firstIndex] == 'z') {
            firstIndex--
        }
        (firstIndex..passwordArray.lastIndex).forEach {
            passwordArray[it] = passwordArray[it] + 1
            if (!passwordArray[it].isLetter()) {
                passwordArray[it] = 'a'
            }
        }
        return String(passwordArray)
    }

    // Check if the password meets the requirements
    private fun isValid(password: String): Boolean {
        val arr: List<String> = password.split("")
        (1..arr.size - 4).forEach {
            // Check requirements
            if (arr[it + 1].first().toInt()==arr[it].first().toInt() + 1 && arr[it + 2].first().toInt()==arr[it].first().toInt() + 2) {
                    return !REGEX_IOL.matches(password) && REGEX_PAIRS.containsMatchIn(password)
            }
        }
        return false
    }

    fun solve(): String {
        password = increment(password)
        while (!isValid(password)) {
            password = increment(password)
        }
        return password
    }
}

fun main(args: Array<String>) {
    val password = "hepxcrrq"
    print(Day11Part1(password).solve())
}