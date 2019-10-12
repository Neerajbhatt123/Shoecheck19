package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.Address;
import address.AddressHandler;
import product.Product;

@WebServlet(urlPatterns = "/AddAddressToDB")
public class AddAddressToDB extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AddressHandler adh = new AddressHandler();

		Address ad = new Address(req.getParameter("addressEmail4"), req.getParameter("addressPassword4"),
				req.getParameter("addressAddress"), req.getParameter("addressAddress2"),
				req.getParameter("addressCity"), req.getParameter("addressState"),
				Integer.parseInt(req.getParameter("addressZip")), req.getParameter("addressPhone"));
		adh.insert(ad);
		System.out.println(ad);
		System.out.println(adh.insert(ad));
		resp.sendRedirect("Payment.jsp");

	}

}
