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
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AlumnoInsert", urlPatterns = { "/AlumnoInsert" })
public class AlumnoInsert extends HttpServlet {

    String url = "jdbc:postgresql://127.0.0.1:5432/formdb";
    String usuario = "postgres";
    String clave = "";
    Map<String, Object> datos = new HashMap<>();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] respuestas = req.getParameterValues("respuesta");
        String pregunta = req.getParameter("pregunta");
    
    
        String sqlPregunta = "INSERT INTO preguntas (pregunta , status) VALUES (?, ?) RETURNING id";
        String sqlRespuesta = "INSERT INTO respuesta (id_pregunta, respuesta, votaciones) VALUES (?, ?, ?)";
    
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    
        try (Connection conn = DriverManager.getConnection(url, usuario, clave)) {
            conn.setAutoCommit(false);
    
            try (PreparedStatement pstmtPregunta = conn.prepareStatement(sqlPregunta)) {
                pstmtPregunta.setString(1, pregunta);
                pstmtPregunta.setBoolean(2, true);
    
                ResultSet rs = pstmtPregunta.executeQuery();
                int idPregunta = 0;
                if (rs.next()) {
                    idPregunta = rs.getInt(1);
                }
    
                if (respuestas != null && idPregunta > 0) {
                    try (PreparedStatement pstmtRespuesta = conn.prepareStatement(sqlRespuesta)) {
                        for (String respuesta : respuestas) {
                            pstmtRespuesta.setInt(1, idPregunta);
                            pstmtRespuesta.setString(2, respuesta);
                            pstmtRespuesta.setInt(3, 0); 
                            pstmtRespuesta.addBatch(); // Agregar a batch
                        }
                        pstmtRespuesta.executeBatch(); // Ejecutar batch
                    }
                }
    
                // Confirmar transacción
                conn.commit();
                System.out.println("Pregunta y respuestas insertadas exitosamente.");
            } catch (SQLException e) {
                conn.rollback(); // Revertir cambios si ocurre un error
                e.printStackTrace();
                System.out.println("Error durante la inserción. Transacción revertida.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al conectar con la base de datos.");
        }
    
        resp.sendRedirect("http://localhost:8080/bajas/");

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}



