package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserHandler;

@WebServlet(urlPatterns = "/CheckLoginFormDB")
public class CheckLoginFormDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserHandler uh = new UserHandler();
		String mail = req.getParameter("userEmail"), assword = req.getParameter("userPassword");

		User u = uh.checkUser(mail, assword);
		if (u==null) {
			req.setAttribute("invalid","invalid");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		}
		
		
		else {
			req.getSession().setAttribute("currentUser", u);
			resp.sendRedirect("ViewProduct.jsp");
		}
		

	}

}
