import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EncuestaList", urlPatterns = { "/EncuestaList" })
public class EncuestaList extends HttpServlet {

    String url = "jdbc:postgresql://127.0.0.1:5432/formdb";
    String usuario = "postgres";
    String clave = "";
    Map<String, Object> datos = new HashMap<>();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT ps.id AS pregunta_id, ps.pregunta, ps.status, " +
        "rs.id AS respuesta_id, rs.respuesta, rs.votaciones " +
        "FROM preguntas AS ps " +
        "LEFT JOIN respuesta AS rs " +
        "ON ps.id = rs.id_pregunta " +
        "WHERE ps.status = true;";

             List<Map<String, Object>> preguntas = new ArrayList<>();

            try (Connection conn = DriverManager.getConnection(url, usuario, clave);
                Statement stmt = conn.createStatement()) {

                ResultSet rs = stmt.executeQuery(sql);
                Map<Integer, Map<String, Object>> preguntasMap = new HashMap<>();

                while (rs.next()) {
                    int preguntaId = rs.getInt("pregunta_id");
                    Map<String, Object> pregunta;
                    if (!preguntasMap.containsKey(preguntaId)) {
                        pregunta = new HashMap<>();
                        pregunta.put("id", preguntaId);
                        pregunta.put("pregunta", rs.getString("pregunta"));
                        pregunta.put("status", rs.getBoolean("status"));
                        pregunta.put("respuestas", new ArrayList<Map<String, Object>>()); // Lista de respuestas
                        preguntasMap.put(preguntaId, pregunta);
                    } else {
                        pregunta = preguntasMap.get(preguntaId);
                    }

                    // Agregar la respuesta a la lista de respuestas de la pregunta
                    if (rs.getInt("respuesta_id") != 0) { // Ignorar filas sin respuestas (por LEFT JOIN)
                        Map<String, Object> respuesta = new HashMap<>();
                        respuesta.put("id", rs.getInt("respuesta_id"));
                        respuesta.put("respuesta", rs.getString("respuesta"));
                        respuesta.put("votaciones", rs.getInt("votaciones"));
                        ((List<Map<String, Object>>) pregunta.get("respuestas")).add(respuesta);
                    }
                }

                preguntas.addAll(preguntasMap.values());
            } catch (SQLException e) {
                e.printStackTrace();
            }

            req.setAttribute("preguntasByEncuesta", preguntas);
            req.getRequestDispatcher("encuesta.jsp").forward(req, resp);

    }
}



