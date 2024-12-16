<html>
<head>
     <meta charset="UTF-8">
    <%@ page import="java.io.*" %>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

     <%-- <!-- Contenedor principal -->
     <form class="main" action="<%=request.getContextPath()%>/AlumnoInsert" method="POST" style="display: flex; flex-direction: column;">

        <div class="bg-gray-100">
            <div class="min-h-screen flex items-center justify-center">

              <div class="bg-white p-8 rounded-lg shadow-lg w-[600px]" >
                  <h1 class="text-xl font-semibold mb-4">Agrega un pregunta</h1>
                  <p class="text-gray-600 mb-6">Clic + para agregar una respuesta</p>
                  <div id="container">
                    <div class="mb-4">
                        <input name="pregunta" type="text" placeholder="Escribe tu pregunta" class="email-input w-[450px] px-4 py-2 border rounded-lg text-gray-700 focus:border-blue-500" />
                        <button id="add" class="middle none center rounded-lg bg-[#22c55e] py-3 px-6 font-sans text-xs font-bold uppercase text-white shadow-md shadow-blue-500/20 transition-all hover:shadow-lg hover:shadow-blue-500/40 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none" type="button">
                            <span class="">+</span>
                        </button>
                    </div>
                  </div>
                  <button type="submit" class="w-full bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 focus:outline-none">Crear</button>
              </div>
              
            </div>
        </div>


     </form>
    <script src="addRespuesta.js"></script>       --%>


<div class="flex justify-center items-center min-h-screen bg-gray-100 antialiased">
    <div class="container sm:mt-40 mt-24 my-auto max-w-md border-2 border-gray-200 rounded-[20px] p-3 bg-gray-800">
        <!-- header -->
        <div class="text-center m-6">
            <h1 class="text-3xl font-semibold text-gray-100">CREAR PREGUNTAS</h1>
            <p class="text-gray-200">Crea tu pregunta y tus respuestas</p>
        </div>
        <!-- sign-in -->
        <div class="m-6">
            <form class="mb-4" action="<%=request.getContextPath()%>/AlumnoInsert" method="POST" >
                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Pregunta</label>
                    <input type="text" name="pregunta" id="email" placeholder="Pregunta"
                        class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500">
                </div>

                                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Respuesta #1</label>
                    <input type="text" name="respuesta" id="email" placeholder="Respuesta"
                        class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500">
                </div>

                                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Respuesta #2</label>
                    <input type="text" name="respuesta" id="email" placeholder="Respuesta"
                        class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500">
                </div>

                                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Respuesta #3</label>
                    <input type="text" name="respuesta" id="email" placeholder="Respuesta"
                        class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500">
                </div>

                <div class="mb-6">
                    <button type="submit"
                        class="w-full px-3 py-4 text-white bg-teal-500 rounded-md hover:bg-teal-600 focus:outline-none duration-100 ease-in-out">Crear Pregunta</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>