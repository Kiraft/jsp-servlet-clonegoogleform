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
public class PreguntasDelete extends HttpServlet {

    String url = "jdbc:postgresql://127.0.0.1:5432/formdb";
    String usuario = "postgres";
    String clave = "";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idPregunta =  Integer.parseInt(req.getParameter("idDelete"));

        String sql = """
            WITH deleted_respuestas AS (
                DELETE FROM respuesta
                WHERE id_pregunta = ?
            )
            DELETE FROM preguntas
            WHERE id = ?;
        """;

        try (Connection connection = DriverManager.getConnection(url, usuario, clave);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, idPregunta); // Parámetro para id_pregunta
            statement.setInt(2, idPregunta); // Parámetro para id en preguntas

            int affectedRows = statement.executeUpdate();
            System.out.println("Filas afectadas: " + affectedRows);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("http://localhost:8080/bajas/");
    }

}



