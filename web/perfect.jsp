<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Perfect Product Divisor</title>
</head>
<body>
    <h1>Check Perfect Product Divisor</h1>
    <form method="post">
        <label>Enter a number:</label>
        <input type="number" name="number" required>
        <button type="submit">Check</button>
    </form>

    <% 
        if (request.getMethod().equalsIgnoreCase("POST")) {
            int num = Integer.parseInt(request.getParameter("number"));
            int product = 1;

            out.println("<h3>Divisors of " + num + ": ");
            for (int i = 1; i < num; i++) {
                if (num % i == 0) {
                    out.print(i + " ");
                    product *= i;
                }
            }
            out.println("</h3>");

            if (product == num) {
                out.println("<p>" + num + " is a <strong>Perfect Product Divisor</strong>.</p>");
            } else {
                out.println("<p>" + num + " is <strong>NOT</strong> a Perfect Product Divisor.</p>");
            }
        }
    %>
</body>
</html>
