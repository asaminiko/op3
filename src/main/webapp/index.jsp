<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File" %>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Обчислення рівняння</title>
    <style>
        body { font-family: 'Arial', sans-serif; background-color: #E3F2FD; text-align: center; color: #0D47A1; }
        .container { width: 50%; margin: auto; background: #FFFFFF; padding: 20px; border-radius: 15px; box-shadow: 0px 0px 15px rgba(21, 101, 192, 0.3); }
        h2 { color: #1565C0; }
        input[type="text"] { padding: 5px; border-radius: 5px; border: 1px solid #42A5F5; outline: none; }
        input[type="submit"] { background-color: #1E88E5; color: white; border: none; padding: 10px; border-radius: 5px; cursor: pointer; transition: 0.3s; }
        input[type="submit"]:hover { background-color: #0D47A1; }
        table { width: 100%; margin-top: 20px; border-collapse: collapse; }
        th, td { border: 1px solid #42A5F5; padding: 10px; text-align: center; }
        th { background-color: #BBDEFB; }
    </style>
</head>
<body>
<div class="container">
    <h2>Обчислення функції</h2>

    <% String imagePath = application.getRealPath("/images/img.png");
        File imgFile = new File(imagePath);
        boolean imgExists = imgFile.exists(); %>
    <% if (imgExists) { %>
    <img src="<%= request.getContextPath() %>/images/img.png" alt="Формула" width="200">
    <% } else { %>
    <p style="color:red;">Помилка: зображення не знайдено!</p>
    <% } %>

    <form method="post">
        a: від <input type="text" name="a_start" value="1"> до <input type="text" name="a_end" value="5"> крок <input type="text" name="a_step" value="1"><br><br>
        b: від <input type="text" name="b_start" value="0"> до <input type="text" name="b_end" value="1"> крок <input type="text" name="b_step" value="0.2"><br><br>
        c: від <input type="text" name="c_start" value="1"> до <input type="text" name="c_end" value="5"> крок <input type="text" name="c_step" value="1"><br><br>
        d: від <input type="text" name="d_start" value="1"> до <input type="text" name="d_end" value="5"> крок <input type="text" name="d_step" value="1"><br><br>
        <input type="submit" name="calculate" value="Обчислити">
    </form>

    <% if (request.getParameter("calculate") != null) {
        try {
            double a_start = Double.parseDouble(request.getParameter("a_start"));
            double a_end = Double.parseDouble(request.getParameter("a_end"));
            double a_step = Double.parseDouble(request.getParameter("a_step"));
            double b_start = Double.parseDouble(request.getParameter("b_start"));
            double b_end = Double.parseDouble(request.getParameter("b_end"));
            double b_step = Double.parseDouble(request.getParameter("b_step"));
            double c_start = Double.parseDouble(request.getParameter("c_start"));
            double c_end = Double.parseDouble(request.getParameter("c_end"));
            double c_step = Double.parseDouble(request.getParameter("c_step"));
            double d_start = Double.parseDouble(request.getParameter("d_start"));
            double d_end = Double.parseDouble(request.getParameter("d_end"));
            double d_step = Double.parseDouble(request.getParameter("d_step"));

            out.println("<h2>Результат</h2>");
            out.println("<table>");
            out.println("<tr><th>a</th><th>b</th><th>c</th><th>d</th><th>y</th></tr>");

            for (double a = a_start; a <= a_end; a += a_step) {
                for (double b = b_start; b <= b_end; b += b_step) {
                    for (double c = c_start; c <= c_end; c += c_step) {
                        for (double d = d_start; d <= d_end; d += d_step) {
                            try {
                                double tanA = Math.tan(a);
                                double acosB = Math.acos(b);
                                double sinhD = Math.sinh(d);
                                if (Double.isNaN(acosB)) {
                                    throw new ArithmeticException("NaN");
                                }
                                double y = 2 * Math.sqrt(tanA / Math.abs(acosB)) - 3 * Math.cbrt(Math.exp(c - a) * sinhD);
                                if (Double.isNaN(y)) {
                                    out.println("<tr><td>" + a + "</td><td>" + b + "</td><td>" + c + "</td><td>" + d + "</td><td>Не існує</td></tr>");
                                } else if (Double.isInfinite(y)) {
                                    out.println("<tr><td>" + a + "</td><td>" + b + "</td><td>" + c + "</td><td>" + d + "</td><td>Нескінченність</td></tr>");
                                } else {
                                    out.println("<tr><td>" + a + "</td><td>" + b + "</td><td>" + c + "</td><td>" + d + "</td><td>" + y + "</td></tr>");
                                }
                            } catch (Exception ex) {
                                out.println("<tr><td>" + a + "</td><td>" + b + "</td><td>" + c + "</td><td>" + d + "</td><td>Не існує</td></tr>");
                            }
                        }
                    }
                }
            }
            out.println("</table>");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Помилка: введіть коректні числові значення!</p>");
        }
    } %>
</div>
</body>
</html>
