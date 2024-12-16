<html>
<head>
     <meta charset="UTF-8">
    <%@ page import="java.util.*, java.util.Map" %>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
                        <%  

                            Map<String, Object> dataPregunta = (Map<String, Object> ) request.getSession().getAttribute("datosUpdateDespuesta"); 

                        %>
  

<div class="flex justify-center items-center min-h-screen bg-gray-100 antialiased">
    <div class="container sm:mt-40 mt-24 my-auto max-w-md border-2 border-gray-200 rounded-[20px] p-3 bg-gray-800">
        <!-- header -->
        <div class="text-center m-6">
            <h1 class="text-3xl font-semibold text-gray-100">CREAR PREGUNTAS</h1>
            <p class="text-gray-200">Crea tu pregunta y tus respuestas</p>
        </div>
        <!-- sign-in -->
        <div class="m-6">
            <form class="mb-4" action="<%=request.getContextPath()%>/PreguntasUpdate" method="POST" >
                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Pregunta</label>
                        <input
                            type="hidden"
                            value="<%= dataPregunta.get("pregunta_id") %>"
                            name="idPregunta"
                         />
                    <input type="text" value="<%= dataPregunta.get("pregunta") %>"name="newPregunta" id="email" placeholder="Pregunta"
                        class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500">
                </div>

                    <%
                        List<Map<String, Object>> rps = (List<Map<String, Object>>) dataPregunta.get("respuestas");
                        for (Map<String, Object> r : rps) {
                        %>  


                            <div class="mb-6">

                                <input
                                    type="hidden"
                                    value="<%= r.get("respuesta_id") %>"
                                    name="idRespuesta"
                                />
                                <label for="email" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Respuesta #2</label>
                                <input type="text" value="<%=r.get("respuesta") %>" name="valueRespuesta" id="email" placeholder="Respuesta"
                                    class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500">
                            </div>

                         <%
                        } 
                    %>

                <div class="mb-6">
                    <button type="submit"
                        class="w-full px-3 py-4 text-white bg-teal-500 rounded-md hover:bg-teal-600 focus:outline-none duration-100 ease-in-out">Actualizar Pregunta</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>