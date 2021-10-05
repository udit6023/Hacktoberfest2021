import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.format.FormatStyle

fun main(args: Array<String>) {

    val current = LocalDateTime.now()

    val formatter = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)
    val formatted = current.format(formatter)

    println("Current Date is: $formatted")
}