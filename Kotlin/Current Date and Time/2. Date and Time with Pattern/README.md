# Date and Time with Pattern

In the above program, we've defined a pattern of format ```Year-Month-Day Hours:Minutes:Seconds.Milliseconds``` using a ```DateTimeFormatter``` object.

Then, we've used ```LocalDateTime```'s ```format()``` method to use the given ```formatter```. This gets us the formatted string output.