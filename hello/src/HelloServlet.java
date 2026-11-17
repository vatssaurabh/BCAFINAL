import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><title>Hello World Servlet</title></head>");
            out.println("<body style='font-family: sans-serif; padding: 2rem;'>");
            out.println("<h1>Hello World from Apache Tomcat Servlet!</h1>");
            out.println("<p>Your servlet is up and running.</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
