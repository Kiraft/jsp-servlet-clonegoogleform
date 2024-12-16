
    const add = document.querySelector("#add");
    const container = document.querySelector("#container");

    add.addEventListener("click", () => {
      // Crear un nuevo contenedor
      const newField = document.createElement("div");
      newField.className = "mb-4 w-[300px]";

      // Crear un nuevo input
      const input = document.createElement("input");
      input.name = "respuesta";
      input.type = "text";
      input.placeholder = "Respuest #" + (container.querySelectorAll("input[name='respuesta']").length + 1);
      input.className = "email-input w-full px-4 py-2 border rounded-lg text-gray-700 focus:border-blue-500";

      // Añadir el input al contenedor
      newField.appendChild(input);

      // Añadir el contenedor al container principal
      container.appendChild(newField);
    });