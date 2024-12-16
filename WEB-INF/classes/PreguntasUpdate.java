import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet(name = "PreguntasUpdate", urlPatterns = {"/PreguntasUpdate"})
public class PreguntasUpdate extends HttpServlet {

    String url = "jdbc:postgresql://127.0.0.1:5432/formdb";
    String usuario = "postgres";
    String clave = "";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idUpdate"));
        Map<String, Object> preguntaRespuesta = new HashMap<>();
        int count = 0;
        
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        String queryVerify = "SELECT SUM(votaciones) FROM respuesta WHERE id_pregunta = ?";

        try (Connection conn = DriverManager.getConnection(url, usuario, clave);
                PreparedStatement stmt = conn.prepareStatement(queryVerify)) {

                stmt.setInt(1, id);

                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    count = rs.getInt("sum");
                }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (count > 0) {
            resp.sendRedirect("http://localhost:8080/bajas/");
        } else {
            String sql = "SELECT p.id as p_id, p.pregunta, r.id, r.respuesta, r.votaciones FROM preguntas p INNER JOIN respuesta r ON p.id = r.id_pregunta WHERE p.id = ?";
        
            try (Connection conn = DriverManager.getConnection(url, usuario, clave);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setInt(1, id);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        preguntaRespuesta.put("pregunta_id", rs.getInt("p_id")); 
                        preguntaRespuesta.put("pregunta", rs.getString("pregunta"));

                        List<Map<String, Object>> respuestas = new ArrayList<>();
                        do {
                            Map<String, Object> respuesta = new HashMap<>();
                            respuesta.put("respuesta_id", rs.getInt("id")); 
                            respuesta.put("respuesta", rs.getString("respuesta"));
                            respuesta.put("votaciones", rs.getInt("votaciones"));
                            respuestas.add(respuesta);
                        } while (rs.next());

                        preguntaRespuesta.put("respuestas", respuestas);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            System.out.println("Datos para enviar a la sesión:");
            System.out.println("Pregunta ID: " + preguntaRespuesta.get("pregunta_id"));
            System.out.println("Pregunta: " + preguntaRespuesta.get("pregunta"));
            System.out.println("Respuestas:");
            List<Map<String, Object>> respuestas = (List<Map<String, Object>>) preguntaRespuesta.get("respuestas");
            if (respuestas != null) {
                for (Map<String, Object> respuesta : respuestas) {
                    System.out.println(" - Respuesta ID: " + respuesta.get("respuesta_id"));
                    System.out.println("   Respuesta: " + respuesta.get("respuesta"));
                    System.out.println("   Votaciones: " + respuesta.get("votaciones"));
                }
            } else {
                System.out.println("No se encontraron respuestas.");
            }

            HttpSession session = req.getSession();
            session.setAttribute("datosUpdateDespuesta", preguntaRespuesta);

            resp.sendRedirect("updatePregunta.jsp");    
        }

        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idPregunta = Integer.parseInt(req.getParameter("idPregunta"));
        String newPregunta = req.getParameter("newPregunta");
        String [] idRespuestas = req.getParameterValues("idRespuesta");
        String [] valuesRespuestas = req.getParameterValues("valueRespuesta");
        
        String sql1 = "UPDATE respuesta SET respuesta = ? WHERE id = ? ";
        String sql2 = "UPDATE preguntas SET pregunta = ? WHERE id = ? ";

        for (int i = 0; i < idRespuestas.length; i++) {
            try(Connection conn = DriverManager.getConnection(url, usuario, clave);
            PreparedStatement pstmt = conn.prepareStatement(sql1)) {

                pstmt.setString(1, valuesRespuestas[i]);
                pstmt.setInt(2, Integer.parseInt(idRespuestas[i]) );

                int filasAfectadas = pstmt.executeUpdate();

                if (filasAfectadas > 0) {
                    System.out.println("ACTUALIZADO CON EXITO");
                } else {
                    System.out.println("NO SE ACTUALIZO NADA");
                }
                
            } catch (Exception e) {
                
            }
        }

        try(Connection conn = DriverManager.getConnection(url, usuario, clave);
        PreparedStatement pstmt = conn.prepareStatement(sql2)) {

            pstmt.setString(1, newPregunta);
            pstmt.setInt(2, idPregunta );

            int filasAfectadas = pstmt.executeUpdate();

            if (filasAfectadas > 0) {
                System.out.println("ACTUALIZADO CON EXITO");
            } else {
                System.out.println("NO SE ACTUALIZO NADA");
            }
            
        } catch (Exception e) {
            
        }

        resp.sendRedirect("http://localhost:8080/bajas/");   

    }
}
