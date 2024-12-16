<%@ page import="java.util.*, java.util.Map" %>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#bae6fd]">
<nav class="flex justify-around py-4 bg-white/80
backdrop-blur-md shadow-md w-full
fixed top-0 left-0 right-0 z-10 gap-[1300px]">

    <!-- Logo Container -->
    <div class="flex items-center">
        <!-- Logo -->
        <a class="cursor-pointer">
            <h3 class="text-2xl font-medium text-blue-500">
                <img class="h-10 object-cover"
                    src="logo.png" alt="Store Logo">
            </h3>
        </a>
    </div>



    <!-- Icon Menu Section -->
    <div class="flex items-center space-x-5">
        <!-- Register -->
        <a class="flex text-gray-600 hover:text-blue-500
        cursor-pointer transition-colors duration-300">

            <svg class="fill-current h-5 w-5 mr-2 mt-0.5" xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="24" height="24" viewBox="0 0 24 24">
                <path
                    d="M12 0L11.34 .03L15.15 3.84L16.5 2.5C19.75 4.07 22.09 7.24 22.45 11H23.95C23.44 4.84 18.29 0 12 0M12 4C10.07 4 8.5 5.57 8.5 7.5C8.5 9.43 10.07 11 12 11C13.93 11 15.5 9.43 15.5 7.5C15.5 5.57 13.93 4 12 4M12 6C12.83 6 13.5 6.67 13.5 7.5C13.5 8.33 12.83 9 12 9C11.17 9 10.5 8.33 10.5 7.5C10.5 6.67 11.17 6 12 6M.05 13C.56 19.16 5.71 24 12 24L12.66 23.97L8.85 20.16L7.5 21.5C4.25 19.94 1.91 16.76 1.55 13H.05M12 13C8.13 13 5 14.57 5 16.5V18H19V16.5C19 14.57 15.87 13 12 13M12 15C14.11 15 15.61 15.53 16.39 16H7.61C8.39 15.53 9.89 15 12 15Z" />
            </svg>
                    <form action="<%=request.getContextPath()%>/ChartServlet" method="POST" class="mb-0 mr-[5px]">
                        <input class="text-gray-700 hover:bg-gray-50 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-blue-700 md:p-0" 
                        type="submit" name=opcion value="Charts">
                    </form>

        </a>
    </div>

</nav>


<%-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/riva-dashboard-tailwind/riva-dashboard.css"> --%>
<div class="flex flex-wrap -mx-3 mb-5 mt-[100px]">
    <div class="w-full max-w-full px-3 mb-6  mx-auto">
        <div
            class="relative flex-[1_auto] flex flex-col break-words min-w-0 bg-clip-border rounded-[.95rem] bg-white m-5">
            <div
                class="relative flex flex-col min-w-0 break-words border border-dashed bg-clip-border rounded-2xl border-stone-200 bg-light/30">
                <!-- card header -->
                <div class="px-9 pt-5 flex justify-between items-stretch flex-wrap min-h-[70px] pb-0 bg-transparent">
                    <h3 class="flex flex-col items-start justify-center m-2 ml-0 font-medium text-xl/tight text-dark">
                        <span class="mr-3 font-semibold text-dark">Tabla</span>
                        <span class="mt-1 font-medium text-secondary-dark text-lg/normal">Status de las preguntas</span>
                    </h3>
                    <div class="flex gap-[15px]">
                        <form action="<%=request.getContextPath()%>/EncuestaList" method="GET" class=" relative flex flex-wrap items-center my-2 bg-blue-500 rounded-full text-white">

                                <button href="http://localhost:8080/bajas/encuesta.jsp" class="inline-block text-[.925rem] font-medium leading-normal text-center align-middle cursor-pointer rounded-2xl transition-colors duration-150 ease-in-out text-light-inverse bg-light-dark border-light shadow-none border-0 py-2 px-5 hover:bg-secondary active:bg-light focus:bg-light" type="submit">
                                    <span class="btnText">Contestar Encuesta</span>
                                </button>
                            
                        </form>
                        <div class="relative flex flex-wrap items-center my-2 bg-blue-500 rounded-full text-white">
                            <a href="http://localhost:8080/bajas/addPregunta.jsp" class="inline-block text-[.925rem] font-medium leading-normal text-center align-middle cursor-pointer rounded-2xl transition-colors duration-150 ease-in-out text-light-inverse bg-light-dark border-light shadow-none border-0 py-2 px-5 hover:bg-secondary active:bg-light focus:bg-light" type="button">
                                <span class="btnText">Agregar pregunta</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- end card header -->
                <!-- card body  -->
                <div class="flex-auto block py-8 pt-6 px-9">
                    <div class="overflow-x-auto">
                        <table class="w-full my-0 align-middle text-dark border-neutral-200">
                            <thead class="align-bottom">
                                <tr class="font-semibold text-[0.95rem] text-secondary-dark">
                                    <th class="pb-3 text-start min-w-[100px]">PREGUNTA</th>
                                    <th class="pb-3 text-start min-w-[100px] ">RESPUESTAS</th>
                                    <th class="pb-3 text-start min-w-[100px]">ESTADO</th>
                                    <th class="pb-3 text-end pr-12 min-w-[175px]">OPCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                                    <%  
                        // Recuperar la lista de clientes que fue pasada al JSP
                        List<Map<String, Object>> pgs = (List<Map<String, Object>>) request.getAttribute("preguntas");
                        if (pgs != null) {
                            for (Map<String, Object> p : pgs) {
                        %>

                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4"><%= p.get("pregunta") %></td>

                                    <td class="px-6 py-4">
                                        <%  
                                            List<Map<String, Object>> rps = (List<Map<String, Object>>) p.get("respuestas");
                                            for (Map<String, Object> r : rps) {
                                                %>

                                                    <p><%=r.get("respuesta") %> - <%=r.get("votaciones") %></p>
                                                    
                                                    
                                                    
                                                <%  
                                            }
                                        %>
                                    </td>

                                    <td class="px-6 py-4">
                                            <div class="inline-flex items-center">
                                                <label
                                                class="relative flex cursor-pointer items-center rounded-full p-3"
                                                for="checkbox-3"
                                                data-ripple-dark="true"
                                                >
                                                    <form action="<%=request.getContextPath()%>/ValidateCheck" method="POST">
                                                        <input type="hidden" name="preguntaId" value="<%= p.get("id") %>" />
                                                    

                                                        	<input
                                                                name="checkstate"
                                                                type="checkbox"
                                                                class="appearance-none w-9 focus:outline-none checked:bg-blue-300 h-5 bg-gray-300 rounded-full before:inline-block before:rounded-full before:bg-blue-500 before:h-4 before:w-4 checked:before:translate-x-full shadow-inner transition-all duration-300 before:ml-0.5"
                                                                id="checkbox-3"
                                                                value= <%= p.get("status") %>
                                                                onchange="this.form.submit()"
                                                                <%= Boolean.parseBoolean(String.valueOf(p.get("status"))) ? "checked" : ""%>
                                                            />
                                                    </form>

                                                    <div class="pointer-events-none absolute top-2/4 left-2/4 -translate-y-2/4 -translate-x-2/4 text-white opacity-0 transition-opacity peer-checked:opacity-100">
                                                        <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        class="h-3.5 w-3.5"
                                                        viewBox="0 0 20 20"
                                                        fill="currentColor"
                                                        stroke="currentColor"
                                                        stroke-width="1"
                                                        >
                                                        <path
                                                            fill-rule="evenodd"
                                                            d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                                                            clip-rule="evenodd"
                                                        ></path>
                                                        </svg>
                                                    </div>
                                                </label>
                                            </div>
                                    </td>

                                    <td class="px-6 py-4">
                                        <div class="flex justify-end gap-4">
                                        <!-- Formulario para Eliminar -->
                                        <form action="<%=request.getContextPath()%>/PreguntasDelete" method="POST" class="inline">
                                            <input type="hidden" name="idDelete" value="<%=p.get("id")%>" />
                                            <button type="submit" class="inline-block rounded-md bg-red-500 px-10 py-2 font-semibold text-red-100 shadow-md duration-75 hover:bg-red-400" title="Delete">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                                            </svg>
                                            </button>
                                        </form>

                                        <!-- Formulario para Editar -->
                                        <form action="<%=request.getContextPath()%>/PreguntasUpdate" method="GET" class="inline">
                                            <input type="hidden" name="idUpdate" value="<%=p.get("id")%>" />
                                            <button type="submit" class="inline-block rounded-md bg-green-500 px-6 py-2 font-semibold text-green-100 shadow-md duration-75 hover:bg-green-400" title="Edit">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125" />
                                            </svg>
                                            </button>
                                        </form>
                                        </div>
                                    </td>
                                </tr>

                        <%  
                            }
                        } else {
                            %>


                            <h1>No hay datos</h1>


                            <% 


                        }
                        %>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
