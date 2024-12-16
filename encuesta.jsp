<html>
<head>
     <meta charset="UTF-8">
    <%@ page import="java.util.*, java.util.Map" %>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col justify-center items-center mt-[10px] bg-[#bae6fd]">

            <img src="banner.png" alt="Texto alternativo" class="rounded-t-lg"/>



            <form class="flex flex-col mt-[20px] " action="<%=request.getContextPath()%>/RespuestasUpdate" method="POST" >

                    <%  
                        
                        List<Map<String, Object>> pgs = (List<Map<String, Object>>) request.getAttribute("preguntasByEncuesta");
                        if (pgs != null) {
                            for (Map<String, Object> p : pgs) {
                    %>

                    <div class="w-[767px] mx-auto mt-[10px] bg-white p-[30px] rounded-t-lg">

                        <label for="countries" class="block mb-2 text-[15px] font-medium text-gray-800 dark:text-gray-800"><%= p.get("pregunta") %></label>
                        <select name="respuesta" 
                        id="countries" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                        required>
                                <option value=""  selected>Selecciona tu respuesta</option>
                                <% 
                                List<Map<String, Object>> rps = (List<Map<String, Object>>) p.get("respuestas");
                                                for (Map<String, Object> r : rps) {
                                %>
                                <option value=<%=r.get("id") %>  %> <%=r.get("respuesta")  %></option>
                                <% 
                                }
                                %>
                        </select>
                        <script src="https://unpkg.com/flowbite@1.4.0/dist/flowbite.js"></script>
                    </div>

                    <%  
                                    }
                                } else {
                                    %>


                                    <h1>No hay preguntas</h1>


                                    <% 


                                }
                                %>


                <div class="flex items-center justify-end mt-[10px] gap-[20px]">

                            <button class="middle none center rounded-lg bg-blue-500 py-3 px-6 font-sans text-xs font-bold uppercase text-white shadow-md shadow-blue-500/20 transition-all hover:shadow-lg hover:shadow-blue-500/40 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none" type="submit">
                                <span class="btnText">Contestar</span>
                            </button>
                                            
                </div>

            </form>


      
       
</body>
</html>