<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.Map" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.jfree.chart.*" %>
<%@ page import="org.jfree.chart.plot.*" %>
<%@ page import="org.jfree.data.general.*" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset.*" %>
<html>
<head>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>


    <div class="flex min-h-screen w-full flex-wrap content-center justify-center p-5 bg-gray-200">
    <div class="grid grid-cols-2 gap-3">

        <%
            int num = (int) request.getSession().getAttribute("chartlenght");

            for (int j = 0; j < num; j++) {
        %>

                <div class="w-80 bg-white p-3">
                    <img class="h-80 w-full object-cover" src="charts/chart<%=j%>.jpeg" />
                    <ul class="mt-3 flex flex-wrap">
                        <h1>Pregunta #<%=j+1%></h1>
                    </ul>
                </div>

        <%
            }
        %>






        
    </div>
</div>
</body>
</html>